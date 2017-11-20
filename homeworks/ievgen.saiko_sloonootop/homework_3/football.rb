class FootballTeam
  attr_accessor :since
  def initialize(name)
    @name = name
  end
  def choice
    puts "Congr., your team is #{@name}!"
  end
end
class FootballCoach
  	def initialize(coachName)
  	  @coachName = coachName
  	end
  	def hello
  	  puts "Hello, #{@coachName}!"  
  	end
end

puts "____________$$$$$$$$$$$$$"
puts "________$$$$$$$ ________ $$$"
puts "_____$$$$$$$$$ ___________ $$$$"
puts "____$$_$$$____$$ ________ $___$$"
puts "___$___$________$ ______ $______$$"
puts "__$___$ _________ $$$$$$$$_______$$"
puts "_$___$$ ________ $$$$$$$$$________$"
puts "$$___$ _________ $$$$$$$$$$________$"
puts "$___$$ _______ $$$$$$$$$$$$________$"
puts "$__$$$$$ __ $$$___$$$$$$$__$$$$___$$"
puts "$$$$$$$$$$$ _______ $$$________$$$$$"
puts "$_$$$$$$$ __________ $__________$$$$"
puts "$_$$$$$$$ __________ $__________$$$$"
puts "_$_$$$$$$ _________ $$__________$$$"
puts "__$_$$__$$ ________ $_________$$_$$"
puts "___$$_____$$$ ___ $$$$$____$$$___$"
puts "____$$ _____ $$$$$$$$$$$$$$$___$$"
puts "_____$$$ _____ $$$$$$$$$$____$$"
puts "_______$$$$ __ $$$$$$$$$__$$$"
puts "__________$$$$$ _____ $$$$"
puts ""
puts "WELCOME TO THE FIRST CUP FINAL by version MOC!"
puts ""
puts ""
puts 'ENTER your name: '
names = gets.chomp
  yourCoach = FootballCoach.new(names)
  
puts "Select your team: A) Argentina and B) Jamaica"
  teams = gets.chomp
  
  case teams
  when "A","a"
    yourTeam = FootballTeam.new("Argentina")
    enemyTeame = FootballTeam.new("Jamaica")
    yourCoach.hello
    yourTeam.choice
  when "B","b"
    yourTeam = FootballTeam.new("Jamaica")
    enemyTeam = FootballTeam.new("Argentina")
    yourCoach.hello
    yourTeam.choice
  end
