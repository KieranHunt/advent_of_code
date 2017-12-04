def has_anagrams(passphrase)
  passphrase
    .sort
    .map_with_index do |value, index|
      sub_passphrase = passphrase.sort[(index + 1)...passphrase.size]
      sub_passphrase.map do |word|
        word.split("").sort == value.split("").sort
      end.any?
    end
    .any?
end

result = File
  .read("4.txt")
  .strip
  .split("\n")
  .map(&.split(" "))
  .reject { |passphrase| has_anagrams(passphrase) }
  .size

puts result
