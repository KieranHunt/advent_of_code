input = File
  .read("13.txt")
  .strip
  .split("\n")
  .map do |depth_and_range|
    depth, range = depth_and_range.split(": ")
    [depth.to_i, range.to_i]
  end
  .to_h

delay = 0
hit = false

loop do
  (0..90).to_a.each do |index|
    range = input[index]
    next if range.nil?
    if (index + delay) % ((range * 2) - 2) == 0
      hit = true
      break
    end
  end
  if hit
    delay += 1
    hit = false
    next
  else
    break
  end
end

puts delay
