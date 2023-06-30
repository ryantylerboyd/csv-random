# row = "  Agana Suburban   GUAM TERRITORIAL LAW           M01 L1303-5-1                       0       42,120                        0.00                               0"
# puts row.gsub(/Agana Suburban+?(?=[ ]{1})/, '')

# apple = ["", "HAGATNA GU 96932", "2200328150", "0", "56,304", "56,304", "21.90", "43.80 RP22049659"]
# pop_data = apple.pop.split(' ')
# print (apple + pop_data)


print Dir["*.pdf"].to_a.map! {|a| __dir__ + "/" + a}
