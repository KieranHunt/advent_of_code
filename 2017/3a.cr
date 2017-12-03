input = 289326

lower_square_root = Math.sqrt(input).floor.to_i
lower_square_root -= 1 if lower_square_root.even?

upper_square_root = Math.sqrt(input).ceil.to_i
upper_square_root += 1 if upper_square_root.even?


lower_square = lower_square_root**2
upper_square = upper_square_root**2


distance_from_edge = (upper_square_root / 2).ceil.to_i

distance_from_middle =
  (0..3)
    .to_a
    .map { |side| (upper_square - distance_from_edge) - (upper_square_root * side) + side }
    .map { |middle| (input - middle).abs }
    .sort
    .first

puts distance_from_edge + distance_from_middle
