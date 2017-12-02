result = File
  .read("1.txt")
  .strip
  .split("")
  .map(&.to_i)
  .try { |input| input + input }
  .try do |input|
    input
      .each_cons((input.size / 4) + 1)
      .to_a
      .[0..(input.size / 2)]
      .compact_map { |digits| digits.first if digits.first == digits.last }
  end
  .reduce { |acc, i| acc + i }

puts result
