grid = []

class Array
  alias_method :old_getter, :[]
  alias_method :old_setter, :[]=

  def [](index)
    old_getter(index % self.size)
  end

  def []=(index, value)
    old_setter(index % self.size, value)
  end
end

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
            .map { |index| rope[current_position + index] }
            .reverse
            .each_with_index { |value, index| rope[current_position + index] = value }

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

puts grid.reduce(0) { |mem, row| mem + row.reduce(0) { |mem, cell| mem += cell.to_i } }
