user_hash = {
  'user' => {
    'first_name_and_last_name' => [
      'first_name' => "user.first_name",
      'last_name' => "user.last_name"
     ],
    'full_name' => "user.full_name"
  }
}

require 'json'
require 'yaml'
require 'active_support'


my_json = JSON.generate(user_hash)
puts "1) JSON - #{my_json}"

my_yaml = YAML.dump(my_json)
puts "2) YAML - #{my_yaml}"

my_xml = my_yaml.transform.to_xml
puts "3) YAML - #{my_xml}"

new_hash = Hash.from_xml(my_xml)
puts "4) New Hash - #{new_hash}"