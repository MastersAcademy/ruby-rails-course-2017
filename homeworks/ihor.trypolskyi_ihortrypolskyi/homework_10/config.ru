require './tamagotchi'
use Rack::Reloader
run Tamagotchi.new('John')
