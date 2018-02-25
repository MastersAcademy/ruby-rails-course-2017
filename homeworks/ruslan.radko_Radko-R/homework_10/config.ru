require 'json'
require './tamagotchi.rb'

use Rack::Static, urls: ['/image'],
    root: 'public'

class Pet
  def call(env)
    req = Rack::Request.new(env)
    case req.path_info
      when '/'
        @pet = Tamagotchi.new
        [200, { 'Content-Type' => 'text/html', 'Cache-Control' => 'public, max-age=86400' }, File.open('public/index.html', File::RDONLY)]
      when '/index.json'
        result = JSON.generate(
            health: @pet.health,
            is_dead: @pet.is_dead,
            feed_indicator: @pet.feed_indicator,
            sleep_indicator: @pet.sleep_indicator,
            fun_indicator: @pet.fun_indicator,
            message: @pet.message,
            image: '/image/pet.jpg'
        )
        [200, { 'Content-Type' => 'text/json' }, [result]]
      when '/feed.json'
        @pet.feed
        result = JSON.generate(
            health: @pet.health,
            is_dead: @pet.is_dead,
            feed_indicator: @pet.feed_indicator,
            sleep_indicator: @pet.sleep_indicator,
            fun_indicator: @pet.fun_indicator,
            message: @pet.message,
            image: '/image/eat.jpg'
        )
        [200, { 'Content-Type' => 'text/json' }, [result]]
      when '/sleep.json'
        @pet.sleep
        result = JSON.generate(
            health: @pet.health,
            is_dead: @pet.is_dead,
            feed_indicator: @pet.feed_indicator,
            sleep_indicator: @pet.sleep_indicator,
            fun_indicator: @pet.fun_indicator,
            message: @pet.message,
            image: '/image/sleep.jpg'
        )
        [200, { 'Content-Type' => 'text/json' }, [result]]
      when '/fun.json'
        @pet.fun
        result = JSON.generate(
            health: @pet.health,
            is_dead: @pet.is_dead,
            feed_indicator: @pet.feed_indicator,
            sleep_indicator: @pet.sleep_indicator,
            fun_indicator: @pet.fun_indicator,
            message: @pet.message,
            image: '/image/fun.jpg'
        )
        [200, { 'Content-Type' => 'text/json' }, [result]]
      else
        not_found = JSON.generate(result: 'Error 404. Page not found !')
        [404, { 'Content-Type' => 'text/json' }, [not_found]]
    end
  end
end

run Pet.new
# to run server 'rackup config.ru' in terminal
