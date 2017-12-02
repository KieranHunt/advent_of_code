puts <<-HEREDOC

=======
TESTING
=======

HEREDOC

{
  "1a" => "1343",
  "1b" => "1274",
  "2a" => "45972",
  "2b" => "326"
}.each do |problem, solution|
  actual = `./#{problem}`.strip
  puts <<-HEREDOC
  Problem:  #{problem}
  Actual:   #{actual.inspect}
  Expected: #{solution.inspect}
  \n
  HEREDOC
  raise "Incorrect solution!" if actual != solution
end
