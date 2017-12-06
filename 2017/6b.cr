input = File
  .read("6.txt")
  .strip
  .split("\t")
  .map { |i| i.to_i }

seen_before = [input]

count = 0

loop do
  input = input.clone

  max_value = input.max
  max_index = input.index { |i| i == max_value }

  input[max_index.not_nil!] = 0

  index = max_index

  max_value.times do
    index = (index.not_nil! + 1) % input.size
    input[index.not_nil!] += 1
  end
  count += 1
  break if seen_before.map { |i| i == input }.any?
  seen_before << input
end

puts seen_before.size - seen_before.map { |i| i == input }.index { |i| i == true }.not_nil!
