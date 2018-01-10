require './tamagochi.rb'
require 'json'
use Rack::Reloader

class Pet
  def call(env)
  	req = Rack::Request.new(env)
  	case req.path_info
  	when '/'
      [200, {'Content-Type' => 'text/html'}, ['Hello! This is tamagochi game'], File.open('index.html')]
    when '/index.json'
      @pet = Cat.new(Myrchik)
      result = JSON.generate(
      	hunger: @pet.hunger,
      	sleep: @pet.sleep,
      	mood: @pet.mood,
      	message: @pet.message,
      	is_dead: @pet.is_dead)
      [200, {'Content-Type' => 'text/json'}, [result]]
    when 'feed.json'
      @pet.feed
      result = JSON.generate(
        hunger: @pet.hunger,
        sleep: @pet.sleep,
        mood: @pet.mood,
     	message: @pet.message,
     	is_dead: @pet.is_dead)
      [200, {'Content-Type' => 'text/json'}, [result]]
    when 'fall_asleap.json'
    	@pet.fall_asleap
    	result = JSON.generate(
    		hunger: @pet.hunger,
    		sleep: @pet.sleep,
    		mood: @pet.mood,
    		message: @pet.message,
    		is_dead: @pet.is_dead)
    	[200, {'Content-Type' => 'text/json'}, [result]]
    when 'play.json'
    	@pet.play
    	result = JSON.generate(
    		hunger: @pet.hunger,
    		sleep: @pet.sleep,
    		mood: @pet.mood,
    		message: @pet.message,
    		is_dead: @pet.is_dead)
    	[200, {'Content-Type' => 'text/json'}, [result]]
    else
    	not_found = JSON.generate(
    		message: 'The page is not not found')
    	[404, {'Content-Type' => 'text/json'} [not_found]]
    end
  end
end
