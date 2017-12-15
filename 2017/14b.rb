grid = []


(0..127)
  .to_a
  .each do |row|
    skip_size = 0
    current_position = 0

    rope = (0..255).to_a

    64.times do
      "jxqlasbh-#{row}"
        .split('')
        .map(&:ord)
        .tap { |lengths| lengths.concat [17, 31, 73, 47, 23] }
        .each do |length|
          (0...length)
            .to_a
            .map { |index| rope[(current_position + index) % rope.size] }
            .reverse
            .each_with_index { |value, index| rope[(current_position + index) % rope.size] = value }

          current_position += length + skip_size
          skip_size += 1
        end
    end

    grid << rope
      .each_slice(16)
      .map { |slice| slice.reduce(0, &:^) }
      .map { |block| block.to_s(16) }
      .map { |item| "#{'0' * (2 - item.size)}#{item}" }
      .join
      .split('')
      .map { |hex_char| hex_char.hex.to_s(2).rjust(hex_char.size*4, '0') }
      .map { |bin_char| bin_char.split('') }
      .flatten
  end

grid = grid
  .map { |row| row.map { |cell| cell.eql?('1') ? '#' : '.'  } }

@group_number = 0

def find_neighbours(grid, x, y)
  return if x < 0
  return if x > 255
  return if y < 0
  return if y > 255
  if grid.dig(y, x) && grid.dig(y, x).eql?('#')
    grid[y][x] = @group_number
    find_neighbours(grid, x + 1, y)
    find_neighbours(grid, x - 1, y)
    find_neighbours(grid, x, y + 1)
    find_neighbours(grid, x, y - 1)
  end
end

grid.each_with_index do |row, y|
  row.each_with_index do |_, x|
    if grid.dig(y, x).eql? '#'
      find_neighbours(grid, x, y)
      @group_number += 1
    end
  end
end

puts @group_number
