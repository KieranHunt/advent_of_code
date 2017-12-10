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

File
  .read("10.txt")
  .strip
  .split(",")
  .map(&:to_i)
  .each do |length|
    (0...length)
      .to_a
      .map { |index| rope[current_position + index] }
      .reverse
      .each_with_index { |value, index| rope[current_position + index] = value }

    current_position += length + skip_size
    skip_size += 1
  end

puts rope[0] * rope[1]
