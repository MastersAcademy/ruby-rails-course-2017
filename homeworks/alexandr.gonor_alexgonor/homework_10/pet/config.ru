require 'json'
require './dog.rb'
use Rack::Reloader

# Pet
class Pet
  def call(env)
    req = Rack::Request.new(env)
    case req.path_info
    when '/'
      @pet = Dog.new('Sirko')
      [200, { 'Content-Type' => 'text/html', 'Cache-Control' => 'public, max-age=86400' } ]
    when '/index.json'
      result = JSON.generate(
        health: @pet.health,
        feed_status: @pet.hunger,
        sleep_status: @pet.asleep,
        fun_status: @pet.play,
        message: @pet.message
      )
      [200, { 'Content-Type' => 'text/json' }, [result]]
    when '/feed.json'
      @pet.feed
      result = JSON.generate(
        health: @pet.health,
        feed_status: @pet.hunger,
        sleep_status: @pet.asleep,
        fun_status: @pet.play,
        message: @pet.message
      )
      [200, { 'Content-Type' => 'text/json' }, [result]]
    when '/sleep.json'
      @pet.go_to_sleep
      result = JSON.generate(
        health: @pet.health,
        feed_status: @pet.hunger,
        sleep_status: @pet.asleep,
        fun_status: @pet.play,
        message: @pet.message
      )
      [200, { 'Content-Type' => 'text/json' }, [result]]
    when '/fun.json'
      @pet.game
      result = JSON.generate(
        health: @pet.health,
        feed_status: @pet.hunger,
        sleep_status: @pet.asleep,
        fun_status: @pet.play,
        message: @pet.message
      )
      [200, { 'Content-Type' => 'text/json' }, [result]]
    else
      not_found = JSON.generate(result: 'Error 404. Page not found !')
      [404, { 'Content-Type' => 'text/json' }, [not_found]]
    end
  end
end

run Pet.new
