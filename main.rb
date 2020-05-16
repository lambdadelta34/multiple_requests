# frozen_string_literal: true

require 'csv'

# read the string filename
filename = gets.strip
data = CSV.read(filename, col_sep: ' ')
hash = Hash.new(0)

data.each do |row|
  timestamp = row[3][1..-1]
  hash[timestamp] += 1
end

result = hash.select { |_, v| v > 1 }.keys

File.open("req_#{filename}", 'w') do |file|
  file.write result.join("\n")
end
