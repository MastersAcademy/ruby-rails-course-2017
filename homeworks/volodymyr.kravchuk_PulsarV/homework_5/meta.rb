class Meta
  def initialize(methods)
    methods.each do |name, value|
      define_singleton_method(name) do
        puts "Method <#{name}> puts: #{value}"
      end
    end
  end
end

hash = {}
while true
  print 'Enter method name or press <Enter> for finish: '
  method_name = gets.chomp
  if method_name.empty?
    instance = Meta.new(hash)
    hash.each_key do |method|
      instance.public_send(method)
    end
    break
  elsif !/^[a-z_][a-zA-Z_0-9]*$/.match(method_name)
    puts 'Invalid method name!'
  else
    print 'Enter text value for this method: '
    method_value = gets.chomp
    hash[method_name] = method_value
  end
end