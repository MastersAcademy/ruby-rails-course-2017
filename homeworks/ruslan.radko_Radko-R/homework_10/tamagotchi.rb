class Tamagotchi
  attr_accessor :health, :feed_indicator, :sleep_indicator, :fun_indicator, :message, :dead

  def initialize
    @name = 'Кузя'
    @feed_indicator = 50
    @sleep_indicator = 50
    @fun_indicator = 50
    @illness = 0
    health_calculate
    @dead = false
    dead?
    @message = @name + ' знову живий.'
  end

  def feed
    @message = @name + 'їсть.'
    @feed_indicator += 50
    @sleep_indicator -= 10
    @fun_indicator -= 10
    all_in_range
    health_calculate
    dead?
  end

  def sleep
    @message = @name + ' спить 30 хвилин.'
    @feed_indicator -= 10
    @sleep_indicator += 50
    @fun_indicator -= 10
    all_in_range
    health_calculate
    dead?
  end

  def fun
    @message = @name + 'бавиться.'
    @feed_indicator -= 10
    @sleep_indicator -= 10
    @fun_indicator += 50
    all_in_range
    health_calculate
    dead?
  end

  private

  def health_calculate
    dead?
    @health = (@feed_indicator + @sleep_indicator + @fun_indicator) / 3 - @illness
    @illness = 0
  end

  def all_in_range
    @feed_indicator = in_range(@feed_indicator)
    @sleep_indicator = in_range(@sleep_indicator)
    @fun_indicator = in_range(@fun_indicator)
  end

  def in_range(variable)
    if variable > 100
      variable = 100
      @illness += 10
    end

    if variable < 0
      variable = 0
      @illness += 10
    end
    variable
  end

  def dead?
    if @health == 0
      @message = 'Ваш єнот помер.'
      @dead = true
    end
  end
end
