target = 289326
value = 0

memory = { { x: 0, y: 0 } => 1, { x: 1, y: 0 } => 1 }

x = 1
y = 0

index = 2

def sum_surrounds(memory, x, y)
  [-1, 0, 1]
    .try do |x_offsets|
      x_offsets
        .map { |x_offset| x_offsets.map { |y_offset| [x_offset, y_offset] } }
    end
    .reduce { |acc, i| acc + i  }
    .map { |offsets| memory.fetch({ x: x + offsets.first, y: y + offsets.last }, 0) }
    .reduce { |acc, i| acc + i }
end

loop do
  lower_square_root = Math.sqrt(index).floor.to_i
  lower_square_root -= 1 if lower_square_root.even?

  upper_square_root = Math.sqrt(index).ceil.to_i
  upper_square_root += 1 if upper_square_root.even?


  lower_square = lower_square_root**2
  upper_square = upper_square_root**2

  numbers_per_side = (upper_square - lower_square) / 4

  [
    { loop_count: numbers_per_side - 1, delta: -> { y += 1 } },
    { loop_count: numbers_per_side, delta: -> { x -= 1 } },
    { loop_count: numbers_per_side, delta: -> { y -= 1 } },
    { loop_count: numbers_per_side + 1, delta: -> { x += 1 } }
  ].each do |info|
    info[:loop_count].times do
      info[:delta].call
      index += 1

      value = sum_surrounds(memory, x, y)

      memory[{ x: x, y: y }] = value
      break if value > target
    end
    break if value > target
  end
  break if value > target
end

puts value
