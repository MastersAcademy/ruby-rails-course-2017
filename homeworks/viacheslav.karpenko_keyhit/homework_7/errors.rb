require 'json'
file = File.read('my_json.json')
data_hash = JSON.parse(file)

movie_name = data_hash['movieName']
first_name = data_hash['firstName']
last_name = data_hash['lastName']
natural_mother = data_hash['parents']['naturalMother']
natural_father = data_hash['parents']['naturalFather']

class ActionPerson
  def initialize(movie_name, first_name, last_name, natural_mother, natural_father)
    self.movie_name = movie_name
    self.first_name = first_name
    self.last_name = last_name
    self.natural_mother = natural_mother
    self.natural_father = natural_father
  end

  def movie_name=(movie_name)
    puts "Movie name - #{movie_name}"
  end

  def first_name=(first_name)
    puts "First name - #{first_name}"
  end

  def last_name=(last_name)
    puts "Last name - #{last_name}"
  end

  def natural_mother=(natural_mother)
    puts "Natural mother - #{natural_mother}"
  end

  def natural_father=(natural_father)
    puts "Natural father - #{natural_father}"
  end
end

ActionPerson.new(movie_name, first_name, last_name, natural_mother, natural_father)

puts''
puts '---  Errors ---'

begin
  if last_name.empty? || last_name.empty?
    raise ArgumentError.new('Last name must have name!')
  end
rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
ensure
  puts 'Last name error.'
end

begin
  if natural_father.empty? || natural_father.empty?
    raise ArgumentError.new('Natural father must be present')
  end
rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
ensure
  puts 'Natural father name error.'
end

# native JSON 
# {
#    "movieName": "Terminator 2: Judgment Day",
#    "firstName": "John",
#    "lastName": "",
#    "parents": {
#        "naturalMother": "Sarah Connor",
#        "naturalFather": ""
#    }
# }

# Result or parsing and raising errors
# Movie name - Terminator 2: Judgment Day
# First name - John
# Last name - 
# Natural mother - Sarah Connor
# Natural father - 

# ---  Errors ---
# Last name must have name!
# ["errors.rb:48:in `<main>'"]
# Last name error.
# Natural father must be present
# ["errors.rb:59:in `<main>'"]
# Natural father name error.
