require 'json'
require './dog.rb'

# Pet
class Pet
  def call(env)
    req = Rack::Request.new(env)
    case req.path_info
    when '/'
      [200, { 'Content-Type' => 'text/html', 'Cache-Control' => 'public, max-age=86400' }, File.open('public/index.html', File::RDONLY)]
    when '/index.json'
      @@pet = Dog.new('Sirko')
      result = JSON.generate(
        health: @@pet.health,
        hunger: @@pet.hunger,
        asleep: @@pet.asleep,
        play: @@pet.play,
        runaway: @@pet.runaway
      )
      [200, { 'Content-Type' => 'text/json' }, [result]]
    when '/feed.json'
      @@pet.feed
      result = JSON.generate(
        health: @@pet.health,
        hunger: @@pet.hunger,
        asleep: @@pet.asleep,
        play: @@pet.play,
        runaway: @@pet.runaway
      )
      [200, { 'Content-Type' => 'text/json' }, [result]]
    when '/go_to_sleep.json'
      @@pet.go_to_sleep
      result = JSON.generate(
        health: @@pet.health,
        hunger: @@pet.hunger,
        asleep: @@pet.asleep,
        play: @@pet.play,
        runaway: @@pet.runaway
      )
      [200, { 'Content-Type' => 'text/json' }, [result]]
    when '/game.json'
      @@pet.game
      result = JSON.generate(
        health: @@pet.health,
        hunger: @@pet.hunger,
        asleep: @@pet.asleep,
        play: @@pet.play,
        runaway: @@pet.runaway
      )
      [200, { 'Content-Type' => 'text/json' }, [result]]
    when '/defend_master.json'
      @@pet.defend_master
      result = JSON.generate(
        health: @@pet.health,
        hunger: @@pet.hunger,
        asleep: @@pet.asleep,
        play: @@pet.play,
        runaway: @@pet.runaway
      )
      [200, { 'Content-Type' => 'text/json' }, [result]]
    when '/clean.json'
      @@pet.clean
      result = JSON.generate(
        health: @@pet.health,
        hunger: @@pet.hunger,
        asleep: @@pet.asleep,
        play: @@pet.play,
        runaway: @@pet.runaway
      )
      [200, { 'Content-Type' => 'text/json' }, [result]]
    else
      not_found = JSON.generate(result: 'Error 404. Page not found !')
      [404, { 'Content-Type' => 'text/json' }, [not_found]]
    end
  end
end

run Pet.new
