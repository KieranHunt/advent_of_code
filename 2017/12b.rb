source = {}

File
  .read("12.txt")
  .strip
  .split("\n")
  .each do |lines|
    key, values = lines.split(" <-> ")
    source[key] = values.split(', ')
  end

connected_to_source = []

groups = []

def find_connections(connected_to_source, source, current)
  connected_to_source << current
  source[current]&.each do |next_val|
    next if connected_to_source.include? next_val
    find_connections(connected_to_source, source, next_val)
  end
end

source.each do |key, _|
  connected_to_source = []
  find_connections(connected_to_source, source, key)
  groups << connected_to_source
end

puts groups
  .map(&:sort)
  .map(&:join)
  .uniq
  .size
