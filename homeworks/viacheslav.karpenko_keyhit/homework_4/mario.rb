hash_sign = '#'
iterates = 20
iterates.times do |x|
  iterates -= 1
  stair = hash_sign * (x + 1)
  hashes_piramida = stair.insert(0, (' ') * iterates)
  half_piramida = hashes_piramida.insert(-1, ' ')
  full_piramida = half_piramida + half_piramida.reverse
  puts "#{full_piramida}"
end
