sum = 0
curr_depth = 0
garbage = false
ignore_next = false

input = File
  .read("9.txt")
  .strip
  .split("")

input
  .each_with_index do |char, index|
    if ignore_next
      ignore_next = false
      next
    end

    case char
    when '!'
      ignore_next = true
    when '{'
      curr_depth += 1 unless garbage
    when '}'
      unless garbage
        sum += curr_depth
        curr_depth -= 1
      end
    when '<'
      garbage = true
    when '>'
      garbage = false
    end
  end
  puts sum
