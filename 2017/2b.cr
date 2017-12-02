def get_divisor(index, row)
  row[(index + 1)..(row.size)].find { |cell| (row[index] % cell) == 0 }
end

result =  File
  .read("2.txt")
  .strip
  .split("\n")
  .map { |row| row.split("\t").map { |cell| cell.to_i } }
  .map(&.sort)
  .map(&.reverse)
  .map do |row|
    (0...row.size).compact_map do |index|
      divisor = get_divisor(index, row)
      row[index] / divisor unless divisor.nil?
    end.first
  end.reduce { |acc, i| acc + i }

puts result
