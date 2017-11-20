PYRAMIDS_FILL_SYMBOL = '#'
PYRAMIDS_BLANK_SYMBOL = ' '

while true
  print 'Enter height of pyramids (integer >= 2) or press <Enter> to exit: '
  input = gets.chomp
  if input == ''
    break
  elsif input.to_i.to_f == input.to_f && input.to_i >= 2
    height = input.to_i
    height.times do |i|
      half_pyramids_row = PYRAMIDS_BLANK_SYMBOL * (height - i - 1) + PYRAMIDS_FILL_SYMBOL * (i + 1) + PYRAMIDS_BLANK_SYMBOL
      puts half_pyramids_row + half_pyramids_row.reverse
    end
    break
  end
  puts "Value '#{input}' does not meet the requirement 'integer >= 2'"
end



