class ZradaDomenException < StandardError
  
  attr_reader :zrada_mail
  
  def initialize(zrada_mail)
    @zrada_mail = zrada_mail
  end
  
end

class MyMail
  
  attr_reader :name, :email
  
  def name=(name)
    if name.nil? || name.size.zero?
      raise ArgumentError.new('Every user must has a name.')
    end
    name = name.dup
    name[0] = name[0].chr.capitalize
    @name = name
  end
  
  def email=(email)
    if email.nil? || email.size.zero?
      raise ArgumentError.new('An e-mail record can`t be empty.')
    end
    if email =~ /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    else 
      raise ArgumentError.new('Enter correct e-mail.')
    end

  	# customized array of the e-mail domens exceptions
  	zrada_array = ["mail.ru", "mail.ua", "bk.ru", "list.ru", "inbox.ru", "yandex.ua", "yandex.ru", "bitrix24.ru", "bitrix24.ua"]
  	
    zrada_array.each {|element|
      if email.include? element
        raise ZradaDomenException.new(email), "Your #{email} is on blocked mail domen - #{element}"
      end
      @email = email
    }
  end
  
  def user_mail
    "#{@name} has e-mail: #{@email}"
  end 
  
  def initialize(name, email)
    self.name = name
    self.email = email
  end
end  

  print "Enter your name, please - "
  name = gets.chomp.to_s
  print "Enter your e-mail: "
  email = gets.chomp.to_s
  
  begin
    my_mail = MyMail.new(name, email)
    puts "#{my_mail.name}, your verificated e-mail is: #{my_mail.email}"
    puts my_mail.user_mail
  rescue ArgumentError => error_type1
    puts error_type1.message
    puts "User must has a name and correct e-mail!"
  rescue ZradaDomenException => error_type2
    puts error_type2.zrada_mail
    puts error_type2.message
  ensure
  	puts "Don't use blocked mail domens"
  end