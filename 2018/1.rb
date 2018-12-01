require 'json'

def solve_a(input)
  parse_input(input)
    .reduce(0, &:+)
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
  result
end

def parse_input(input)
  input
    .split("\n")
    .map(&:strip)
    .map(&:to_i)
end

def solve(event:, context:)
  part = event['queryStringParameters']['part']
  input = event['body']
  /a-z/.match? part
  result = send("solve_#{part}".to_s, input)
  { statusCode: '200', headers: {}, body: result.to_json }
rescue => e
  { statusCode: '500', headers: {}, body: e.to_json }
end 

if $0 == __FILE__
  file_name, part = ARGV
  input = File.read(file_name)
  puts send("solve_#{part}".to_s, input)
end
