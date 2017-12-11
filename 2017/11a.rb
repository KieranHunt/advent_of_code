x = 0
y = 0
z = 0

File
  .read("11.txt")
  .strip
  .split(",")
  .each do |direction|
    case direction
    when 's'
      x += 1
      z -= 1
    when 'se'
      y += 1
      z -= 1
    when 'ne'
      y += 1
      x -= 1
    when 'n'
      x -= 1
      z += 1
    when 'nw'
      y -= 1
      z += 1
    when 'sw'
      y -= 1
      x += 1
    end
  end

  puts [x.abs, y.abs, x.abs].max
