def solve_a(input)
  result = parse_input(input)
    .reduce(0, &:+)
    
  puts result
end

def solve_b(input)
  result = nil
  parse_input(input)
    .cycle
    .each_with_object(0 => 1, 'current' => 0) do |value, memo|
      memo['current'] += value
      if memo[memo['current']]
        result = memo['current']
        break
      end
      memo[memo['current']] = true
    end 
  puts result
end

def parse_input(input)
  input
    .split("\n")
    .map(&:strip)
    .map(&:to_i)
end

if $0 == __FILE__
  file_name, part = ARGV
  input = File.read(file_name)
  send("solve_#{part}".to_s, input)
end
