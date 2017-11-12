class Human

  attr_accessor :name, :salary

  def initialize(name, salary)
    @name = name
    @salary = salary
  end
end

class Player < Human

  attr_accessor :name, :number, :team

  def initialize (name, number, team)
    @name = name
    @number = number
    @team = team
  end

  def short_pass
    puts name+' makes a short_pass'
  end

  def long_pass
    puts name+' makes a long pass'
  end

  def get_the_ball
    puts name+' gets the ball'
  end

  def deffend
    puts name+' goes into deffence'
  end

  def attack
    puts name+' runs into attack'
  end

  def foot_strike
    puts name+' strikes with his foot'
  end

  def head_strike
    puts name+' strikes with his head'
  end
end

class Forward < Player

  def leave
    puts name+' leaves the football area'
  end

  def powerfull_strike
    puts name+' attempts to make a powerfull strike'
  end

  def dash
    puts name+' goes dash'
  end

  def dribbling
    puts name+' uses his dribbling skills'
  end
end

class Deffender < Player

  def push_enemy
    puts name+' pushes his enemy'
  end

  def pick_the_ball
    puts name+' picks the ball from the enemy'
  end

  def pressure
    puts name+' begins to pressure the enemy team'
  end

  def foul
    puts name+' kicks the enemy to save the gates'
  end

  def block_player
    puts name+' blocks the enemy player'
  end

class Goalkeeper < Player

  def save
    puts name+' saves the gate'
  end
end

class Referee < Human

  def show_yellow_card
    puts name+' decides that the foul is not so bad and shows the player a yellow card'
  end

  def show_red_card
    puts name+' decides that the foul is very bad and shows the player a red card'
  end

  def start_the_game
    puts name+' whistles which means the game can be started'
  end

  def stop_the_game
    puts name+' whistles twice which means the game is over'
  end

  def pause_the_game
    puts name+' whistles and stops the game'
  end

  def resume_the_game
    puts name+' whistles and resumes the game'
  end

  def appoint_free_kick
    puts name+' appoints a free kick after a foul'
  end

  def appoint_penalty
    puts name+' appoints a penalty after a foul'
  end

  def score_goal
    puts name+' scores a goal after a good strike'
  end
end

forward = Forward.new("Artem K.", 20, "home")
deffender1 = Deffender.new("Harold I.", 15, "home")
deffender2 = Deffender.new("Jack L.", 2, "visitor")
goalkeeper = Goalkeeper.new("Bob B.", 4, "visitor")
referee = Referee.new("James C.", 560)

referee.start_the_game
forward.short_pass
deffender1.get_the_ball
deffender1.long_pass
forward.get_the_ball
deffender2.foul
referee.pause_the_game
referee.show_yellow_card
referee.appoint_free_kick
forward.powerfull_strike
goalkeeper.save
goalkeeper.long_pass
deffender2.get_the_ball
deffender1.pick_the_ball
deffender1.short_pass
forward.get_the_ball
forward.dash
forward.dribbling
forward.powerfull_strike
referee.score_goal
referee.stop_the_game
end
