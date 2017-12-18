class Smartphone

  attr_reader :brand, :price, :color, :waterproof

  def brand=(brand)
    if brand.nil? || brand.size.zero?
      raise ArgumentError.new('Each smartphone must have a brand.')
    end
    brand = brand.dup
    brand[0] = brand[0].chr.capitalize
    @brand = brand
  end

  def price=(price)
    if price.nil? || price.size.zero?
      raise ArgumentError.new('Each item has its own price.')
    end
    if price > 50000
      raise ArgumentError.new('Man, you buy a phone, not a car!')
    end
    @price = price
  end

  def color=(color)
    if color.nil? || color.size.zero?
      raise ArgumentError.new('Pleasure, write a color!')
    end
    @color = color
  end

  def waterproof=(waterproof)
    if waterproof.nil? ||waterproof.size.zero?
      raise ArgumentError.new('Pleasure, write "yes" or "no"!')
    end

    if waterproof == "yes"
      puts "You can swim with this phone!"
    end
    if waterproof == "no"
      puts "Be careful with water!"
    end
    @waterproof = waterproof
  end

    def smartphone
      "#{@brand} #{@price} #{@color} #{@waterproof}"
    end

    def initialize(brand, price, color, waterproof)
      self.brand = brand
      self.price = price
      self.color = color
      self.waterproof = waterproof
    end
end

sony = Smartphone.new('Sony', 11000, 'black', 'yes')
puts sony.smartphone
lg = Smartphone.new('LG', 15000, 'white', 'no')
begin
  sony.brand = nil
rescue ArgumentError
    puts "Oops, mistake!"
ensure
  lg = Smartphone.new('LG', 15000, 'white', 'no')
end
begin
  lg.waterproof = 'no'
  puts  "Be careful with water!"
ensure
  puts "You can buy Sony"
end
begin
  lg.color = 0
rescue ArgumentError
  puts "Pleasure, write a color!"
ensure
  puts "We have black Sony and white LG!"
end






