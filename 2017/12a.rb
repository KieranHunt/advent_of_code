source = {}

File
  .read("12.txt")
  .strip
  .split("\n")
  .each do |lines|
    key, values = lines.split(" <-> ")
    source[key] = values.split(', ')
  end

@connected_to_source = []

def find_connections(source, current)
  @connected_to_source << current
  source[current]&.each do |next_val|
    next if @connected_to_source.include? next_val
    find_connections(source, next_val)
  end
end

find_connections(source, "0")

puts @connected_to_source.size
