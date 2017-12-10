rope = (0...256)
  .to_a

skip_size = 0
current_position = 0

class Array
  alias_method :old_getter, :[]
  alias_method :old_setter, :[]=

  def [](index)
    old_getter(index % self.size)
  end

  def []=(index, value)
    self.old_setter(index % self.size, value)
  end
end

64.times do
  File
    .read("10.txt")
    .strip
    .split("")
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

puts rope
  .each_slice(16)
  .map { |slice| slice.reduce(0, &:^) }
  .map { |block| block.to_s(16) }
  .map { |item| "#{'0' * (2 - item.size)}#{item}" }
  .join
