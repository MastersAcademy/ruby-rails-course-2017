module YamlConverter
  class Railtie < Rails::Railtie
    initializer "my_railtie.configure_rails_initialization" do |app|
    app.middleware.use MyRailtie::Middleware
  end
end
