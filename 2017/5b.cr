input = File
  .read("5.txt")
  .strip
  .split("\n")
  .map { |i| i.to_i }

index = 0
count = 0

loop do
  count += 1
  index_old = index
  index += input[index]
  if input[index_old] >= 3
    input[index_old] -= 1
  else
    input[index_old] += 1
  end
  if input.size <= index
    puts count
    break
  end
end
