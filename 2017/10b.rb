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

dense_hash = []

rope
  .each_slice(16) { |slice| dense_hash << slice.reduce(0, &:^) }

result = dense_hash
  .map { |block| block.to_s(16) }
  .map do |i|
    if i.size == 1
      "0#{i}"
    else
      i
    end
  end
  .join

puts result
