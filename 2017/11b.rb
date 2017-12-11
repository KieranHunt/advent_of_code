x = 0
y = 0
z = 0

xs = []
ys = []
zs = []

File
  .read("11.txt")
  .strip
  .split(",")
  .each do |direction|
    case direction
    when 's'
      x += 1
      z -= 1
      xs << x
      zs << z
    when 'se'
      y += 1
      z -= 1
      ys << y
      zs << z
    when 'ne'
      y += 1
      x -= 1
      ys << y
      xs << x
    when 'n'
      x -= 1
      z += 1
      xs << x
      zs << z
    when 'nw'
      y -= 1
      z += 1
      ys << y
      zs << z
    when 'sw'
      y -= 1
      x += 1
      ys << y
      xs << x
    end
  end

puts [xs, ys, zs]
  .map { |direction| direction.map(&:abs).max }
  .max
