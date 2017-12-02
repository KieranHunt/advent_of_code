result = File
  .read("1.txt")
  .strip
  .split("")
  .map(&.to_i)
  .try { |input| input << input.first }
  .try do |input|
    input
      .each_cons(2)
      .to_a
      .compact_map { |cons| cons[0] if cons[0] == cons[1] }
  end
  .reduce { |acc, i| acc + i }

puts result
