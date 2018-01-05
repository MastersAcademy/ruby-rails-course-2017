#Tamagochi via rack

class Tamagotchi
  def initialize(name)
    @name = name
    @belly = 15
    @energy = 15
  end

  def call(env)
    @treat = "<div
      <b><a href = \"/eat\">Feed</a> |
      <a href = \"/play\">Play</a> |
      <a href = \"/sleep\">Put to bed</a>
      </div>"

    @new_game = "<div
      <b><a href = \"/new_game\">Start new game</a>
      </div>"

    request = Rack::Request.new(env)

    case request.path_info
    when '/'
      [200, {'Content-Type' => 'text/html'}, ["Hello, I'm #{@name}! </br><h1>#{@image}</h1> </br> #{@new_game} "]]
    when '/new_game'
      new_game
      [200, {'Content-Type' => 'text/html'}, ["#{@treat if @die_message.empty?} </br><h1>#{@image}</h1></br> belly: #{@belly} </br> <progress value=#{@belly} max=30>
</progress> #{@eat_message} </br> energy: #{@energy} </br> <progress value=#{@energy} max=30>
</progress> #{@energy_message} </br></br> #{@die_message} </br> #{@new_game unless @die_message.empty?} "]]
    when "/eat"
      eat
      [200, {"Content-Type" => "text/html"}, ["#{@treat if @die_message.empty?} </br><h1>#{@image}</h1></br> belly: #{@belly} </br> <progress value=#{@belly} max=30>
</progress> #{@eat_message} </br> energy: #{@energy} </br> <progress value=#{@energy} max=30>
</progress> #{@energy_message} </br></br> #{@die_message} </br> #{@new_game unless @die_message.empty?}"]]
    when "/play"
      play
      [200, {"Content-Type" => "text/html"}, ["#{@treat if @die_message.empty?} </br><h1>#{@image}</h1></br> belly: #{@belly} </br> <progress value=#{@belly} max=30>
</progress> #{@eat_message} </br> energy: #{@energy} </br> <progress value=#{@energy} max=30>
</progress> #{@energy_message} </br></br> #{@die_message} </br> #{@new_game unless @die_message.empty?}"]]
    when "/sleep"
      sleep
      [200, {"Content-Type" => "text/html"}, ["#{@treat if @die_message.empty?} </br><h1>#{@image}</h1></br> belly: #{@belly} </br> <progress value=#{@belly} max=30>
</progress> #{@eat_message} </br> energy: #{@energy} </br> <progress value=#{@energy} max=30>
</progress> #{@energy_message} </br></br>#{@die_message} </br> #{@new_game unless @die_message.empty?}"]]
    end
  end

  def new_game
    @belly = 15
    @energy = 15
    @energy_message = @eat_message = @die_message = ""
    @image = '&#128516;'
  end

  def eat
    @belly += 6
    @energy -= 3
    check
  end

  def play
    @belly -= 3
    @energy -= 3
    check
  end

  def sleep
    @belly -= 3
    @energy = 30
    check
  end

  private

  def check
    died if @belly >= 30 || @belly <= 0 || @energy <= 0

    case
    when @belly > 15 && @belly < 30
      @eat_message = "#{@name}'s full"
      @image = '&#128552;'
    when @belly > 0 && @belly <= 6
      @eat_message = "#{@name}'s hungry"
      @image = '&#128543;'
    when @belly <= 0 || @belly >= 30
      @eat_message = "it's fatal!"
      @image = '&#128531;'
    else
      @eat_message = nil
    end

    case
    when @energy > 0 && @energy <= 8
      @energy_message = "#{@name}'s tired"
      @image = '&#128553;'
    when @energy <= 0
      @energy_message = "it's fatal!"
      @image = '&#128531;'
    else
      @energy_message = nil
    end
  end

  def died
    @die_message = "Sorry, #{@name} has died".upcase
  end
end
