input = File
  .read("13.txt")
  .strip
  .split("\n")
  .map do |depth_and_range|
    depth, range = depth_and_range.split(": ")
    [depth.to_i, range.to_i]
  end
  .to_h

severity = 0

(0...90).to_a.each do |index|
  range = input[index]
  next if range.nil?
  if index % ((range * 2) - 2) == 0
    severity += index * range
  end
end

puts severity
