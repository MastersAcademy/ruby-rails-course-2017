require 'json'
require './tamagotchi.rb'

use Rack::Static, urls: ['/images'],
                  root: 'public'

# Pet
class Pet
  def call(env)
    req = Rack::Request.new(env)
    case req.path_info
    when '/'
      [200, { 'Content-Type' => 'text/html', 'Cache-Control' => 'public, max-age=86400' }, File.open('public/index.html', File::RDONLY)]
    when '/index.json'
      @@pet = Tamagotchi.new('Pigeon')
      result = JSON.generate(name: @@pet.name, fullness: @@pet.fullness, is_dead: @@pet.is_dead,
                             cheerfullness: @@pet.cheerfullness, mood: @@pet.mood, message: @@pet.message, image: '/images/pet.jpg')
      [200, { 'Content-Type' => 'text/json' }, [result]]
    when '/feed.json'
      @@pet.feed
      result = JSON.generate(name: @@pet.name, fullness: @@pet.fullness, is_dead: @@pet.is_dead,
                             cheerfullness: @@pet.cheerfullness, mood: @@pet.mood, message: @@pet.message, image: '/images/eat.jpg')
      [200, { 'Content-Type' => 'text/json' }, [result]]
    when '/walk.json'
      @@pet.walk
      result = JSON.generate(name: @@pet.name, fullness: @@pet.fullness, is_dead: @@pet.is_dead,
                             cheerfullness: @@pet.cheerfullness, mood: @@pet.mood, message: @@pet.message, image: '/images/walk.jpg')
      [200, { 'Content-Type' => 'text/json' }, [result]]
    when '/put_to_bed.json'
      @@pet.put_to_bed
      result = JSON.generate(name: @@pet.name, fullness: @@pet.fullness, is_dead: @@pet.is_dead,
                             cheerfullness: @@pet.cheerfullness, mood: @@pet.mood, message: @@pet.message, image: '/images/sleep.jpg')
      [200, { 'Content-Type' => 'text/json' }, [result]]
    else
      error_hash = JSON.generate(result: "I'm Lost!")
      [404, { 'Content-Type' => 'text/json' }, [error_hash]]
    end
  end
end

run Pet.new
# to run server 'rackup config.ru' in terminal
