result = File
  .read("4.txt")
  .strip
  .split("\n")
  .map { |passphrase| passphrase.split(" ") }
  .map { |passphrase| passphrase.group_by { |e| e }.map { |_, count| !(count.size > 1) } }
  .map(&.all?)
  .select(&.==(true))
  .size

puts result
