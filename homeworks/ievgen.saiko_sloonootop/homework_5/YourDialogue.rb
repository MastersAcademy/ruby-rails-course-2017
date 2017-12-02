class YourDialogue
  def initialize (questions)
    @answers = {}
    puts "Let`s begin!"
    
    # Hash to the methods
    questions.each do |key, value| 
      print value
      define_singleton_method(key) { print value }
      
      # Hash of the answers (input)
      @answers[key] = String(gets.chomp)
    end
    
    # Hash of the answers (output)
    puts "Hash of the answers contains such values: "
    @answers.each {|key, value| puts "Key #{key} has answer - '#{value}'"}
  end
end

# Hash of the questions (input)
questions = { 
  hello: "Welcome to World Championship of codeball! ", 
  play: "Do you wanna play codeball? ", 
  name: "Enter your name and become our coach! ",  
  congr: "Congr., you are a coach of the Jamaica codeball team! ", 
  game: "What kind of the game do you prefer? (atack or defence) ", 
  start: "Type Yes to start or No to exit " 
}

# Dialogue
puts "Do you ready?"
print "Press 1 if your are ready or 2 - if not: "
answer = gets.chomp.to_i
 case
 when answer == 1
   dialogue = YourDialogue.new(questions)
   puts "Thank you! Try new methods in the terminal"
 end