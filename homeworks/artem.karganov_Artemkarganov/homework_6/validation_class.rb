class Weapon

  attr_reader :name, :caliber, :weight, :firepower

  def name=(name)
    if name.nil?
      raise ArgumentError.new('Your beauty should have a name, just type it')
    end
    @name = name
  end

  def caliber=(caliber)
    if caliber.nil?
      raise ArgumentError.new('Each weapon should have a caliber.')
    end
    if caliber >= 10
      raise ArgumentError.new('We do not sell heavy-caliber weapon')
    end
    @caliber = caliber
  end


  def weight=(weight)
    if weight.nil? || weight.zero?
      raise ArgumentError.new('Each weapon should have a weight.')
    end
    if weight >= 40
      raise ArgumentError.new('This one is too heavy for a human')
    end
    @weight = weight
  end

  def firepower=(firepower)
    if firepower.nil?
      raise ArgumentError.new('What? Can you shoot with this one? It should have a firepower')
    end
    if firepower >= 550
      raise StandardError.new ('HOLLY-MOLLY! What the hell is that?!')
    end
    @firepower = firepower
  end

  def weapon
    "#{@name} - #{@caliber} #{@weight} #{@firepower}"
  end

  def initialize(name, caliber, weight, firepower)
    self.name = name
    self.caliber = caliber
    self.weight = weight
    self.firepower = firepower
  end
end

 pistol = Weapon.new('TT', 9, 0.5, 25)
 puts pistol.weapon
 machinegun = Weapon.new('Maksima', 7.62, 20.7, 250)
begin
  machinegun.name = nil
rescue ArgumentError
  p "Oh, forget about it"
ensure
  maksima = Weapon.new('Maksima', 7.62, 20.7, 250)
  p maksima
#  machinegun = Weapon.new(nil, 2.5, 30, 100)
end
begin
  maksima.firepower = 1000
  p maksima
ensure
  p "Maksima is the best machinegun ever"
end
