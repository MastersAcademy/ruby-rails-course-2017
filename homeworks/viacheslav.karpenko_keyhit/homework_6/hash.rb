require 'json'

sequrity = %w[Ben John Larry]
cashiers = %w[William Gloria Natali]
shop = { 'Departaments' => { 'Electronic' => { 'Tvsets' => { 'Tv_brand_1' => { 'Resolution' => '800 x 600', 'Price' => 1200 },
                                                             'Tv_brand_2' => { 'Resolution' => '1280 x 768', 'Price' => 3200 },
                                                             'Tv_brand_3' => { 'Resolution' => '1920 x 1080', 'Price' => 5000 } },
                                               'Smartphones' => { 'Smart__brand_1' => { 'Cores' => 4, 'Screen' => 'TFT' },
                                                                  'Smart__brand_2' => { 'Cores' => 8, 'Screen' => 'IPS' } } },
                             'Personnel' => {
                               'Sequrity' => sequrity,
                               'Cashiers' => cashiers
                             } } }
class Converter
  class << self
    def result(default_hash)
      puts 'Showing hash shop.'
      puts default_hash
      puts ''
      puts 'Showing json shop.'
      json = convert_to_json(default_hash)
      p json
      puts ''
      puts 'Showing reconverted shop.'
      reconverted_hash = convert_to_hash(convert_to_json(default_hash))
      p reconverted_hash
    end

    def convert_to_json(shop_hash)
      shop_hash.to_json
    end

    def convert_to_hash(shop_json)
      JSON.parse(shop_json)
    end
  end
end

Converter.result(shop)

# CLI output
# Output hash shop.
# {"Departaments"=>{"Electronic"=>{"Tvsets"=>{"Tv_brand_1"=>{"Resolution"=>"800 x 600", "Price"=>1200}, "Tv_brand_2"=>{"Resolution"=>"1280 x 768", "Price"=>3200}, "Tv_brand_3"=>{"Resolution"=>"1920 x 1080", "Price"=>5000}}, "Smartphones"=>{"Smart__brand_1"=>{"Cores"=>4, "Screen"=>"TFT"}, "Smart__brand_2"=>{"Cores"=>8, "Screen"=>"IPS"}}}, "Personnel"=>{"Sequrity"=>["Ben", "John", "Larry"], "Cashiers"=>["William", "Gloria", "Natali"]}}}

# Output json shop.
# "{\"Departaments\":{\"Electronic\":{\"Tvsets\":{\"Tv_brand_1\":{\"Resolution\":\"800 x 600\",\"Price\":1200},\"Tv_brand_2\":{\"Resolution\":\"1280 x 768\",\"Price\":3200},\"Tv_brand_3\":{\"Resolution\":\"1920 x 1080\",\"Price\":5000}},\"Smartphones\":{\"Smart__brand_1\":{\"Cores\":4,\"Screen\":\"TFT\"},\"Smart__brand_2\":{\"Cores\":8,\"Screen\":\"IPS\"}}},\"Personnel\":{\"Sequrity\":[\"Ben\",\"John\",\"Larry\"],\"Cashiers\":[\"William\",\"Gloria\",\"Natali\"]}}}"

# Output reconverted shop.
# {"Departaments"=>{"Electronic"=>{"Tvsets"=>{"Tv_brand_1"=>{"Resolution"=>"800 x 600", "Price"=>1200}, "Tv_brand_2"=>{"Resolution"=>"1280 x 768", "Price"=>3200}, "Tv_brand_3"=>{"Resolution"=>"1920 x 1080", "Price"=>5000}}, "Smartphones"=>{"Smart__brand_1"=>{"Cores"=>4, "Screen"=>"TFT"}, "Smart__brand_2"=>{"Cores"=>8, "Screen"=>"IPS"}}}, "Personnel"=>{"Sequrity"=>["Ben", "John", "Larry"], "Cashiers"=>["William", "Gloria", "Natali"]}}}
