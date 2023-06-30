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

pdf_files = Dir["*.pdf"].to_a.map! {|a| __dir__ + "/" + a}

pdf_files.each do |pdf_file_location|
  puts "Working on file #{pdf_file_location}"
# Open the file data to the reader
reader = PDF::Reader.new(pdf_file_location)
puts records.size
# search through each line in the document
reader.pages.each do |page|
  table = page.text.scan(/^.+/)
  table.each do |row|
    unless ["Count:","Department of Revenue and Taxation","2022 Real Property Tax Assessment Roll","guam_Tax_Assd_Roll","TAG","Assd Value"].any? {|word| row.include? word}
    # Now that we can see each row we can sort out the data from it.
      if row =~ /[ ][M][0-1][0-9][ ][A-Z]/ || (row.match? 'GOVERNMENT OF GUAM')
        #Edit the Record here ----------->
        if record_object[:owner] == ""
        else

          # Only one record and the data_1 size is one mostly John doe
          if !record_object[:data_1].nil?
            if record_object[:data_1].size==1
            record_object[:data_1][0] = record_object[:data_1][0].unshift("")
            record_object[:address_line_1] = record_object[:data_1][0][1]
            record_object[:parcel_number] = record_object[:data_1][0][2]
            record_object[:building_area] = record_object[:data_1][0][3]
            record_object[:building_assed_value] = record_object[:data_1][0][4]
            record_object[:total_assed_value] = record_object[:data_1][0][5]
            record_object[:second_installment] = record_object[:data_1][0][6]
            record_object[:total_tax] = record_object[:data_1][0][7]
            record_object[:invoice_number] = record_object[:data_1][0][8]
            end
          end

          # USE CASE FOR WHEN THERE IS NO ADDRESS with size 2
          if !record_object[:data_1].nil?
            if record_object[:data_1].size==2
              if record_object[:data_1][0][1] == "NONE"
              record_object[:data_1][1] = record_object[:data_1][1].unshift("")
              record_object[:address_line_1] = "NONE"
              record_object[:address_line_2] = "NONE"
              record_object[:parcel_number] = record_object[:data_1][1][2]
              record_object[:building_area] = record_object[:data_1][1][3]
              record_object[:building_assed_value] = record_object[:data_1][1][4]
              record_object[:total_assed_value] = record_object[:data_1][1][5]
              record_object[:second_installment] = record_object[:data_1][1][6]
              record_object[:total_tax] = record_object[:data_1][1][7]
              record_object[:invoice_number] = record_object[:data_1][1][8]
              end
            end
          end

          if !record_object[:data_1].nil?
            if record_object[:data_1].size==2
              unless record_object[:data_1][0][1] == "NONE"
                if record_object[:data_1][1].size != 9
                  if (record_object[:data_1][1][1].to_i.is_a? Integer) && record_object[:data_1][1][1].to_i != 0
                    record_object[:address_line_1] = record_object[:data_1][0][1]
                    record_object[:data_1][1] = record_object[:data_1][1].unshift("")
                    record_object[:address_line_2] = record_object[:data_1][1][1]
                    record_object[:parcel_number] = record_object[:data_1][1][2]
                    record_object[:building_area] = record_object[:data_1][1][3]
                    record_object[:building_assed_value] = record_object[:data_1][1][4]
                    record_object[:total_assed_value] = record_object[:data_1][1][5]
                    record_object[:second_installment] = record_object[:data_1][1][6]
                    record_object[:total_tax] = record_object[:data_1][1][7]
                    record_object[:invoice_number] = record_object[:data_1][1][8]
                  end
                end
              end
            end
          end

          if !record_object[:data_1].nil?
            if record_object[:data_1].size==2
              unless record_object[:data_1][0][1] == "NONE"
                if record_object[:data_1][1].size != 9
                  if (record_object[:data_1][1][1].to_i.is_a? Integer) && record_object[:data_1][1][1].to_i == 0
                    record_object[:address_line_1] = record_object[:data_1][0][1]
                    pop_data = record_object[:data_1][1].pop.split(' ')
                    record_object[:data_1][1] = record_object[:data_1][1] + pop_data
                    record_object[:address_line_2] = record_object[:data_1][1][1]
                    record_object[:parcel_number] = record_object[:data_1][1][2]
                    record_object[:building_area] = record_object[:data_1][1][3]
                    record_object[:building_assed_value] = record_object[:data_1][1][4]
                    record_object[:total_assed_value] = record_object[:data_1][1][5]
                    record_object[:second_installment] = record_object[:data_1][1][6]
                    record_object[:total_tax] = record_object[:data_1][1][7]
                    record_object[:invoice_number] = record_object[:data_1][1][8]
                  end
                end
              end
            end
          end

          if !record_object[:data_1].nil?
            if record_object[:data_1].size==2
              unless record_object[:data_1][0][1] == "NONE"
                if record_object[:data_1][1].size == 9
                  if (record_object[:data_1][1][1].to_i.is_a? Integer) && record_object[:data_1][1][1].to_i == 0
                    record_object[:address_line_1] = record_object[:data_1][0][1]
                    pop_data = record_object[:data_1][1].pop.split(' ')
                    record_object[:data_1][1] = record_object[:data_1][1] + pop_data
                    record_object[:address_line_2] = record_object[:data_1][1][1]
                    record_object[:parcel_number] = record_object[:data_1][1][2]
                    record_object[:building_area] = record_object[:data_1][1][3]
                    record_object[:building_assed_value] = record_object[:data_1][1][4]
                    record_object[:total_assed_value] = record_object[:data_1][1][5]
                    record_object[:second_installment] = record_object[:data_1][1][6]
                    record_object[:total_tax] = record_object[:data_1][1][7]
                    record_object[:invoice_number] = record_object[:data_1][1][8]
                  end
                end
              end
            end
          end

          if !record_object[:data_1].nil?
            if record_object[:data_1].size == 3
                if (record_object[:data_1][0][1] =~ /[0-9]/) && record_object[:data_1][0][1].length > 1
                  record_object[:address_line_1] = (record_object[:data_1][0][1] + " " + record_object[:data_1][1][1]).chomp
                  record_object[:address_line_2] = record_object[:data_1][2][1]
                  record_object[:parcel_number] = record_object[:data_1][2][2]
                  record_object[:building_area] = record_object[:data_1][2][3]
                  record_object[:building_assed_value] = record_object[:data_1][2][4]
                  record_object[:total_assed_value] = record_object[:data_1][2][5]
                  record_object[:second_installment] = record_object[:data_1][2][6]
                  record_object[:total_tax] = record_object[:data_1][2][7]
                  record_object[:invoice_number] = record_object[:data_1][2][8]

              end
            end
          end

          if !record_object[:data_1].nil?
            if record_object[:data_1].size == 3
              if (record_object[:data_1][0][1] =~ /[0-9]/) && record_object[:data_1][0][1].length > 1
                if record_object[:data_1][2].size == 9
                    record_object[:address_line_1] = record_object[:data_1][0][1] + " " + record_object[:data_1][1][1]
                    record_object[:address_line_2] = record_object[:data_1][2][1]
                    record_object[:parcel_number] = record_object[:data_1][2][2]
                    record_object[:building_area] = record_object[:data_1][2][3]
                    record_object[:building_assed_value] = record_object[:data_1][2][4]
                    record_object[:total_assed_value] = record_object[:data_1][2][5]
                    record_object[:second_installment] = record_object[:data_1][2][6]
                    record_object[:total_tax] = record_object[:data_1][2][7]
                    record_object[:invoice_number] = record_object[:data_1][2][8]
                end
              end
            end
          end

          if !record_object[:data_1].nil?
            if record_object[:data_1].size == 3
              if !(record_object[:data_1][0][1] =~ /[0-9]/) && record_object[:data_1][0][1].length > 1
                if record_object[:data_1][2].size == 9
                    record_object[:owner] = record_object[:owner] + " " + record_object[:data_1][0][1]
                    record_object[:address_line_1] = record_object[:data_1][1][1]
                    record_object[:address_line_2] = record_object[:data_1][2][1]
                    record_object[:parcel_number] = record_object[:data_1][2][2]
                    record_object[:building_area] = record_object[:data_1][2][3]
                    record_object[:building_assed_value] = record_object[:data_1][2][4]
                    record_object[:total_assed_value] = record_object[:data_1][2][5]
                    record_object[:second_installment] = record_object[:data_1][2][6]
                    record_object[:total_tax] = record_object[:data_1][2][7]
                    record_object[:invoice_number] = record_object[:data_1][2][8]
                end
              end
            end
          end

          if !record_object[:data_1].nil?
            if record_object[:data_1].size == 3
              if !(record_object[:data_1][0][1] =~ /[0-9]/) && record_object[:data_1][0][1].length > 1
                if record_object[:data_1][2].size != 9 && record_object[:data_1][1][1] == "NONE"
                    record_object[:data_1][2] =record_object[:data_1][2].unshift("")
                    record_object[:owner] = record_object[:owner] + " " + record_object[:data_1][0][1]
                    record_object[:address_line_1] = "NONE"
                    record_object[:address_line_2] = "NONE"
                    record_object[:parcel_number] = record_object[:data_1][2][2]
                    record_object[:building_area] = record_object[:data_1][2][3]
                    record_object[:building_assed_value] = record_object[:data_1][2][4]
                    record_object[:total_assed_value] = record_object[:data_1][2][5]
                    record_object[:second_installment] = record_object[:data_1][2][6]
                    record_object[:total_tax] = record_object[:data_1][2][7]
                    record_object[:invoice_number] = record_object[:data_1][2][8]

                end
              end
            end
          end

          if !record_object[:data_1].nil?
            if record_object[:data_1].size == 3
              if !(record_object[:data_1][0][1] =~ /[0-9]/) && record_object[:data_1][0][1].length > 1
                if record_object[:data_1][2].size != 9 && record_object[:data_1][1][1] != "NONE"
                  if record_object[:data_1][2][-1] =~ /[.]/
                      pop_data = record_object[:data_1][2].pop.split(' ')
                      record_object[:data_1][2] = record_object[:data_1][2] + pop_data
                      record_object[:owner] = record_object[:owner] + " " + record_object[:data_1][0][1]
                      record_object[:address_line_1] = "NONE"
                      record_object[:address_line_2] = "NONE"
                      record_object[:parcel_number] = record_object[:data_1][2][2]
                      record_object[:building_area] = record_object[:data_1][2][3]
                      record_object[:building_assed_value] = record_object[:data_1][2][4]
                      record_object[:total_assed_value] = record_object[:data_1][2][5]
                      record_object[:second_installment] = record_object[:data_1][2][6]
                      record_object[:total_tax] = record_object[:data_1][2][7]
                      record_object[:invoice_number] = record_object[:data_1][2][8]

                  end
                end
              end
            end
          end

          if !record_object[:data_1].nil?
            if record_object[:data_1].size == 3
              if !(record_object[:data_1][0][1] =~ /[0-9]/) && record_object[:data_1][0][1].length > 1
                if record_object[:data_1][2].size != 9 && record_object[:data_1][1][1] != "NONE"
                  if !(record_object[:data_1][2][-1] =~ /[.]/)
                      record_object[:data_1][2] =record_object[:data_1][2].unshift("")
                      record_object[:owner] = record_object[:owner] + " " + record_object[:data_1][0][1]
                      record_object[:address_line_1] = "NONE"
                      record_object[:address_line_2] = "NONE"
                      record_object[:parcel_number] = record_object[:data_1][2][2]
                      record_object[:building_area] = record_object[:data_1][2][3]
                      record_object[:building_assed_value] = record_object[:data_1][2][4]
                      record_object[:total_assed_value] = record_object[:data_1][2][5]
                      record_object[:second_installment] = record_object[:data_1][2][6]
                      record_object[:total_tax] = record_object[:data_1][2][7]
                      record_object[:invoice_number] = record_object[:data_1][2][8]

                  end
                end
              end
            end
          end

          if !record_object[:data_1].nil?
            if record_object[:data_1].size == 4
              if !(record_object[:data_1][0][1] =~ /[0-9]/) && record_object[:data_1][0][1].length > 1
                record_object[:owner] = record_object[:owner] + " " + record_object[:data_1][0][1]
                record_object[:address_line_1] = record_object[:data_1][1][1] + " " + record_object[:data_1][2][1]
                record_object[:address_line_2] = record_object[:data_1][3][1]
                record_object[:parcel_number] = record_object[:data_1][3][2]
                record_object[:building_area] = record_object[:data_1][3][3]
                record_object[:building_assed_value] = record_object[:data_1][3][4]
                record_object[:total_assed_value] = record_object[:data_1][3][5]
                record_object[:second_installment] = record_object[:data_1][3][6]
                record_object[:total_tax] = record_object[:data_1][3][7]
                record_object[:invoice_number] = record_object[:data_1][3][8]

              end
            end
          end

          if !record_object[:data_1].nil?
            if record_object[:data_1].size == 5
              if !(record_object[:data_1][0][1] =~ /[0-9]/) && record_object[:data_1][0][1].length > 1
                record_object[:owner] = record_object[:owner] + " " + record_object[:data_1][0][1]  + " " + record_object[:data_1][1][1]  + " " + record_object[:data_1][2][1]
                record_object[:address_line_1] = record_object[:data_1][3][1]
                record_object[:address_line_2] = record_object[:data_1][4][1]
                record_object[:parcel_number] = record_object[:data_1][4][2]
                record_object[:building_area] = record_object[:data_1][4][3]
                record_object[:building_assed_value] = record_object[:data_1][4][4]
                record_object[:total_assed_value] = record_object[:data_1][4][5]
                record_object[:second_installment] = record_object[:data_1][4][6]
                record_object[:total_tax] = record_object[:data_1][4][7]
                record_object[:invoice_number] = record_object[:data_1][4][8]

              end
            end
          end

        end



        records << record_object
        record_object = {
          owner: "",
          address_line_1: "",
          address_line_2: "",
          legal_description: "",
          parcel_number: 0,
          land_area: 0,
          building_area: 0,
          land_assed_value: 0,
          building_assed_value: 0,
          total_assed_value: 0,
          first_installment: 0,
          second_installment: 0,
          total_tax: 0,
          home_ex: 0,
          invoice_number: "",
          data_1: []
        }
        object_switch = 0
      else
        object_switch = object_switch + 1
      end

      row_gsub_data = row.gsub(/[ ]{2,}/,'|').gsub(/[ ]+?(?=M[0-9])/,'|').split('|').to_a

      if row_gsub_data.size >= 8 || row_gsub_data.size <= 3 && object_switch == 0
        # print row_gsub_data
        # puts "\n"
        row_gsub_data =
        row
        .gsub(/^\s*Agana Heights+?(?=[ ]{1})/, '')
        .gsub(/^\s*Agana Suburban+?(?=[ ]{1})/, '')
        .gsub(/^\s*Agana Urban+?(?=[ ]{1})/, '')
        .gsub(/^\s*Agat Suburban+?(?=[ ]{1})/, '')
        .gsub(/^\s*Agat Urban+?(?=[ ]{1})/, '')
        .gsub(/^\s*Asan Suburban+?(?=[ ]{1})/, '')
        .gsub(/^\s*Asan Urban+?(?=[ ]{1})/, '')
        .gsub(/^\s*Barrigada Suburban+?(?=[ ]{1})/, '')
        .gsub(/^\s*aite+?(?=[ ]{1})/, '')
        .gsub(/^\s*Suburban+?(?=[ ]{1})/, '')
        .gsub(/^\s*Barrigada+?(?=[ ]{1})/, '')
        .gsub(/^\s*Suburban+?(?=[ ]{1})/, '')
        .gsub(/^\s*Barrigada Urban+?(?=[ ]{1})/, '')
        .gsub(/^\s*Chn Pago\/Ordot+?(?=[ ]{1})/, '')
        .gsub(/^\s*Dededo Suburban+?(?=[ ]{1})/, '')
        .gsub(/^\s*Dededo Urban+?(?=[ ]{1})/, '')
        .gsub(/^\s*Inarajan+?(?=[ ]{1})/, '')
        .gsub(/^\s*Machanao+?(?=[ ]{1})/, '')
        .gsub(/^\s*Mangilao+?(?=[ ]{1})/, '')
        .gsub(/^\s*Merizo+?(?=[ ]{1})/, '')
        .gsub(/^\s*Mongmong\/Toto\/M+?(?=[ ]{1})/, '')
        .gsub(/^\s*Piti Suburban+?(?=[ ]{1})/, '')
        .gsub(/^\s*Piti Urban+?(?=[ ]{1})/, '')
        .gsub(/^\s*Santa Rita+?(?=[ ]{1})/, '')
        .gsub(/^\s*Santa Rita Urban+?(?=[ ]{1})/, '')
        .gsub(/^\s*Sinajana+?(?=[ ]{1})/, '')
        .gsub(/^\s*Sinajana Urban+?(?=[ ]{1})/, '')
        .gsub(/^\s*Sumay+?(?=[ ]{1})/, '')
        .gsub(/^\s*Talofofo Suburban+?(?=[ ]{1})/, '')
        .gsub(/^\s*Talofofo Urban+?(?=[ ]{1})/, '')
        .gsub(/^\s*Tamuning+?(?=[ ]{1})/, '')
        .gsub(/^\s*Umatac+?(?=[ ]{1})/, '')
        .gsub(/^\s*Yigo+?(?=[ ]{1})/, '')
        .gsub(/^\s*Yona Urban+?(?=[ ]{1})/, '')
        .gsub(/^\s*Yona Suburban+?(?=[ ]{1})/, '')
        .gsub(/Agana Suburban+?(?=[ ]{1})/, '')
        .gsub(/[ ]{2,}/,'|')
        .gsub(/[ ]+?(?=M[0-9])/,'|')
        .split('|').to_a

        # print row_gsub_data
        # puts "\n"
        # puts "\n"
        # puts "\n"
        # puts "\n"
      else
        # print row_gsub_data
        # puts "\n ------"
      end

      if object_switch == 0
        # puts "\n"
        # puts "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|"
        # print row_gsub_data
        # puts "\n"
        # puts "|______________________________________|"
        # puts "\n"


        if row_gsub_data.size == 7
          # puts "\n"
          # puts "|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|"
          # print row_gsub_data
          # puts "\n"
          # puts "|______________________________________|"
          # puts "\n"
          main_row_data = row_gsub_data
          record_object[:owner] = main_row_data[1]
          record_object[:legal_description] = main_row_data[2]
          record_object[:land_area] = main_row_data[3]
          record_object[:land_assed_value] = main_row_data[4]
          record_object[:first_installment] = main_row_data[5]
          record_object[:home_ex] = main_row_data[6]
        end

      end
      if object_switch >= 1
        record_object[:data_1] << row_gsub_data
      else
        # puts "#{object_switch}:::::" + row.gsub(/Agana Urban+?(?=[ ]{1})/, '').gsub(/Agana Suburban+?(?=[ ]{1})/, '').gsub(/[ ]{2,}/,'|').gsub(/[ ]+?(?=M[0-9])/,'|')
      end


      # puts "#{object_switch}:::::" + row.gsub(/Agana Urban+?(?=[ ]{1})/, '').gsub(/Agana Suburban+?(?=[ ]{1})/, '').gsub(/[ ]{2,}/,'|').gsub(/[ ]+?(?=M[0-9])/,'|')
    end
  end
end
end


outfile = File.join(__dir__, 'output.csv')
outfile_json = File.join(__dir__, 'output_json.txt')
File.write(outfile_json, records)


CSV.open(outfile, "w", headers: records.first.keys) do |csv|
  records.each do |h|
    csv << h.values
  end
end
