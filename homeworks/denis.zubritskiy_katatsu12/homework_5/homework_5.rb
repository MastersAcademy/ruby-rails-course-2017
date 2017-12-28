# Worker
class Worker
  def initialize(hash)
    hash.each do |key, value|
      define_singleton_method(key) { puts value }
    end
  end
end

wor = Worker.new(name: 'Jon',
                 surname: 'X',
                 salary: 50_000,
                 specialty: 'chef')

wor.name
wor.surname
wor.salary
wor.specialty
