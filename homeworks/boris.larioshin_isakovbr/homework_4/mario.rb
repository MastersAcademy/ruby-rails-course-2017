PYRAMID_BLOCK = '#'
PYRAMID_SEPARATOR = ' '
MAX_HEIGHT = 35
MIN_HEIGHT = 2

loop do
  puts 'Please enter mario pyramid height: '
  height = gets.to_i
  if height > MIN_HEIGHT && height < MAX_HEIGHT then
    height.times do |i|
      str = PYRAMID_SEPARATOR * (height - i) + PYRAMID_BLOCK * i
      puts str + '  ' + str.reverse
    end
    break
  else
    puts 'data incorrect'
  end
end

