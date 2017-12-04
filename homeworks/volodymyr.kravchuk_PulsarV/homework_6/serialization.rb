require 'json'

METHOD_NAME_REGEXP = /^[a-z_][a-zA-Z_0-9]*$/

class Human
  def initialize(methods)
    methods.each do |name, value|
      define_singleton_method(name) do
        puts "Method name is <#{name}>, method value is #{value}"
      end
    end
  end
end

hash = {'human' => {}}
loop do
  print 'Enter method name for class <Human> or press <Enter> for finish: '
  method_name = gets.chomp
  if method_name.empty?
    human = Human.new(hash['human'])
    hash['human'].each_key do |method|
      human.public_send(method)
    end
    puts "Human hash: #{hash}"
    human_json = hash.to_json
    puts "Human hash encoded to json: #{human_json}"
    puts "Human hash decoded from json: #{JSON.parse(human_json)}"
    break
  elsif !METHOD_NAME_REGEXP.match(method_name)
    puts 'Invalid method name!'
  else
    print 'Enter value for this method: '
    method_value = gets.chomp
    hash['human'][method_name] = method_value
  end
end