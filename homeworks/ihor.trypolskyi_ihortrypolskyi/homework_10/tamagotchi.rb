# Tamagochi via rack
class Tamagotchi
  def initialize(name)
    @name = name
    @belly = 15
    @energy = 15
  end

  def call(env)
    @treat = '<a href = \'/eat\'>Feed</a> |
              <a href = \'/play\'>Play</a> |
              <a href = \'/sleep\'>Put to bed</a>'

    @new_game = '<a href = \'/new_game\'>Start new game</a>'

    request = Rack::Request.new(env)

    case request.path_info
    when '/'
      root
      [200, { 'Content-Type' => 'text/html' }, ["<h1>Hello, I'm #{@name}!</br>
        #{@image}</h1></br>#{@new_game}"]]
    when '/new_game'
      new_game
      [200, { 'Content-Type' => 'text/html' }, ["<h1>#{@treat \
        if @die_message.empty?}
        #{@die_message}</br>#{@image}</h1>
        <h3>belly: #{@belly}</br><progress value=#{@belly} max=30>
        </progress> #{@eat_message}</br></br>
        energy: #{@energy}</br><progress value=#{@energy} max=30>
        </progress> #{@energy_message}</h3>
        #{@new_game unless @die_message.empty?}"]]
    when '/eat'
      eat
      [200, { 'Content-Type' => 'text/html' }, ["<h1>#{@treat \
        if @die_message.empty?}
        #{@die_message}</br>#{@image}</h1>
        <h3>belly: #{@belly}</br><progress value=#{@belly} max=30>
        </progress> #{@eat_message}</br></br>
        energy: #{@energy}</br><progress value=#{@energy} max=30>
        </progress> #{@energy_message}</h3>
        #{@new_game unless @die_message.empty?}"]]
    when '/play'
      play
      [200, { 'Content-Type' => 'text/html' }, ["<h1>#{@treat \
        if @die_message.empty?}
        #{@die_message}</br>#{@image}</h1>
        <h3>belly: #{@belly}</br><progress value=#{@belly} max=30>
        </progress> #{@eat_message}</br></br>
        energy: #{@energy}</br><progress value=#{@energy} max=30>
        </progress> #{@energy_message}</h3>
        #{@new_game unless @die_message.empty?}"]]
    when '/sleep'
      sleep
      [200, { 'Content-Type' => 'text/html' }, ["<h1>#{@treat \
        if @die_message.empty?}
        #{@die_message}</br>#{@image}</h1>
        <h3>belly: #{@belly}</br><progress value=#{@belly} max=30>
        </progress> #{@eat_message}</br></br>
        energy: #{@energy}</br><progress value=#{@energy} max=30>
        </progress> #{@energy_message}</h3>
         #{@new_game unless @die_message.empty?}"]]
    end
  end

  def root
    feel_well
  end

  def new_game
    feel_well
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

  def feel_well
    @belly = 15
    @energy = 15
    @energy_message = @eat_message = @die_message = ''
    @image = '&#128516;'
  end

  def check
    if @belly >= 30 || @belly <= 0 || @energy <= 0
      @die_message = "Sorry, #{@name} has died".upcase
    end

    @eat_message = if @belly > 15 && @belly < 30
                     "&#128552; #{@name}'s full"
                   elsif @belly > 0 && @belly <= 6
                     "&#128543; #{@name}'s hungry"
                   elsif @belly <= 0 || @belly >= 30
                     "&#128531; it's fatal!"
                   else
                     ''
                   end

    @energy_message = if @energy > 0 && @energy <= 8
                        "&#128553; #{@name}'s tired"
                      elsif @energy <= 0
                        "&#128531; it's fatal!"
                      else
                        ''
                      end

    @image = if @eat_message.empty? && @energy_message.empty?
               '&#128516;'
             elsif !@die_message.empty?
               '&#128128;'
             else
               '&#128543;'
             end
  end
end
