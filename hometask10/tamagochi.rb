# This is Tamagochi program
class Cat
  attr_accessor :name, :hunger, :sleep, :mood, :message, :is_dead

  def initialize(name)
    @name = name
    @hunger = 100
    @sleep = 100
    @mood = 100
    @message = "Your cat #{name} has borned"
    @is_dead = false
  end

  def feed
    @message = "You feed #{name}"
    @hunger += 30
    @sleep -= 10
    @mood -= 10
    state
  end

  def fall_asleep
    @message = "Your Cat #{name} is fell asleep"
    @hunger -= 5
    @sleep += 30
    @mood -= 5
    state
  end

  def play
    @message = "You play with #{name}"
    @hunger -= 10
    @sleep -= 15
    @mood += 30
    state
  end

  private

  def state
    if @hunger <= 0
      @is_dead = true
      @message = "Your Cat #{name} is dead"
    elsif @sleep <= 0
      @is_dead = true
      @message = "Your Cat #{name} is dead"
    end
  end
end
