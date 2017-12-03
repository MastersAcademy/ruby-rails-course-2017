require 'json'
puts hash = {hello: 'Hello my friend)', play: 'Do you wanna play with me?', win: 'Winner, winner, chicken dinner'}
puts variable = hash.to_json
my_hash = JSON.parse(variable)
puts my_hash