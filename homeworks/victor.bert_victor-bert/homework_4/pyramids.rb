#!/usr/bin/env ruby
# coding: utf-8

class Pyramid
  def prompt
    print 'Set the pyramid height (min value 2): '
    height = gets.chomp.to_i
    if height >= 2 && height < 77
      self.build(height)
    else
      puts 'Invalid parameter, try it again.'
      self.prompt
    end
  end

  def build (height = 4 )
    height.times do |index|
      rh = (0...height).map {|i| index >= i ? '#' : ' ' }
      puts [rh.reverse.join(''), rh.join('')].join('  ')
    end
  end
end

pyramid = Pyramid.new
pyramid.prompt
