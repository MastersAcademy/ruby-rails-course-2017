# Tamagotchi
class Tamagotchi
  attr_accessor :name, :fullness, :cheerfullness, :mood, :message, :is_dead

  def initialize(name)
    @name = name
    @fullness = 5
    @cheerfullness = 5
    @mood = 5
    @is_dead = false
    @message = @name + ' was born.'
  end

  def feed
    @message = 'You feed ' + @name + '.'
    @fullness += 1
    @cheerfullness -= 1
    @mood += 1
    check_state
  end

  def walk
    @message = 'You walk ' + @name + '.'
    @fullness -= 1
    @cheerfullness += 1
    @mood += 1
    check_state
  end

  def put_to_bed
    @message = "You put to bed #{@name} .\n"
    #    @fullness -= 1
    @cheerfullness += 1
    @mood -= 1
    check_state
  end

  private

  def check_state
    if @fullness <= 0
      @message = @name + ' has died of hunger!'
      @is_dead = true
    elsif @cheerfullness <= 0
      @message = @name + ' has died of tiredness!'
      @is_dead = true
    elsif @mood <= 0
      @message = @name + ' has died of melancholy!'
      @is_dead = true
    end
  end
end
