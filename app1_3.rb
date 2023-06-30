require 'pdf-reader'
require 'csv'
require "pry-byebug"
require 're'

records = []
record_object = {
}


object_switch = 0

# Set the location of the file
# pdf_file_location = File.join(__dir__, 'test.pdf')
counter = 0
pdf_files = Dir["*.pdf"].to_a.map! {|a| __dir__ + "/" + a}

pdf_files.each do |pdf_file_location|
  puts "Working on file #{pdf_file_location}"
# Open the file data to the reader
  File.open(pdf_file_location, "rb") do |io|
    reader = PDF::Reader.new(pdf_file_location)
    # search through each line in the document

    reader.pages.each do |page|      # OBJECT VARIABLE THAT GETS RESET FOR EACH PAGE
      data_object_store = []
      data_object_store_reset = false

      table = page.text.scan(/^.+/)
      table.each do |row|

        unless ["Count:","Department of Revenue and Taxation","2022 Real Property Tax Assessment Roll","guam_Tax_Assd_Roll","TAG","Assd Value"].any? {|word| row.include? word}
          # Lets create the pdf into csv format so its handled better
          # First at the front of the pdf
          # removes the blank space before the headers
          if row[0..10].count(' ') > 5
            # This is a row that has no header so ignore for now
              print "NO HEADER: "
              row = row.gsub(/^\s*/,'')
              print row
              print "\n"
          else
            #removes the headers and then removes the blank space

              print "Yes HEADER: "
              row = row.gsub(/^\s*/,'').gsub(/^(.*?)[ ]{2}/, '').gsub(/^\s*/,'')
              print row
              print "\n"
          end
          # Now that we have removed all the headers lets see if we can split the cells correctly

          # What this regex does it looks for the invoice number thats how you know your at the end of the line
          # i need to store everything before I get to this line
          if row =~ /[R][P][0-9]{8}/
            #removes all the spaces between columns and splits it into an array
            row = row.gsub(/[ ]{2,}/,'|').gsub(/[ ]+?(?=M[0-9])/,'|').split('|').to_a
            # Since this is the main selector it has to be exactly 8
            row.unshift("") if row.size < 8
            puts "LINE ERROR #{row}" if row.size > 9
            data_object_store_reset = true
          else
            row = row.gsub(/[ ]{2,}/,'|').gsub(/[ ]+?(?=M[0-9])/,'|').split('|').to_a
            data_object_store_reset = false
          end
          data_object_store << row

          if data_object_store_reset
            # puts "BIG ERROR: #{data_object_store[0]}" if data_object_store[0].size !=6
            # puts data_object_store.last.last if data_object_store[0].size !=6
            counter += 1 if data_object_store[0].size !=6
            data_object_store = []
            data_object_store_reset = false
          end
        end
      end
    end
  end
end
puts counter
outfile = File.join(__dir__, 'output.csv')
outfile_json = File.join(__dir__, 'output_json.txt')
File.write(outfile_json, records)


CSV.open(outfile, "w", headers: records.first.keys) do |csv|
  records.each do |h|
    csv << h.values
  end
end
