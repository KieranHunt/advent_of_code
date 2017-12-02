puts File
  .read("2.txt")
  .strip
  .split("\n")
  .map { |row| row.split("\t").map { |cell| cell.to_i } }
  .map { |row| row.max - row.min }
  .reduce { |acc, i| acc + i }
