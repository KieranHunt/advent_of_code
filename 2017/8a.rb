require 'ostruct'

registers = {}

File
  .read("8.txt")
  .strip
  .split("\n")
  .map do |line|
    regexp = /^(?<register>[a-z]*) (?<instruction>dec|inc) (?<value>-{0,1}[0-9]+) if (?<compregister>[a-z]*) (?<operator>.{1,2}) (?<compvalue>-{0,1}[0-9]+)/
      .match(line)
    OpenStruct.new(regexp.names.zip(regexp.captures).to_h)
  end
  .each do |instruction|
    registers[instruction.register] ||= 0
    registers[instruction.compregister] ||= 0
    comp_string = "#{registers[instruction.compregister]} #{instruction.operator} #{instruction.compvalue}"
    if eval(comp_string)
      if instruction.instruction.eql? 'dec'
        registers[instruction.register] -= instruction.value.to_i
      else
        registers[instruction.register] += instruction.value.to_i
      end
    end
  end

max = registers.reduce(0) do |acc, register|
    _, value = register
    if value > acc
      value
    else
      acc
    end
  end

puts max
