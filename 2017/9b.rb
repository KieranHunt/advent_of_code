sum = 0
curr_depth = 0
garbage = false
ignore_next = false
garbage_sum = 0

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
      if garbage
        garbage_sum += 1
      else
        curr_depth += 1
      end
    when '}'
      if garbage
        garbage_sum += 1
      else
        sum += curr_depth
        curr_depth -= 1
      end
    when '<'
      if garbage
        garbage_sum += 1
      else
        garbage = true
      end
    when '>'
      garbage = false
    else
      garbage_sum += 1 if garbage
    end
  end
puts garbage_sum
