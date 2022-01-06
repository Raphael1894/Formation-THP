require 'pry'

class User

  def show_itself
    print "Voici l'instance : "
    puts self 
  end
  
    def greet
      puts "Bonjour, monde !"
    end

    def say_hello_to_someone(first_name)
      puts "Bonjour, #{first_name}"
    end 

  end

  binding.pry
  puts "end of file"

#pry commands
#julie = User.new
#jean = User.new

#julie.say_hello_to_someone("Patrick") # va produire un "Bonjour, Patrick !"
#jean.say_hello_to_someone("Marie") # va produire un "Bonjour, Marie !"

#julie.show_itself #=> va produire un résultat du genre "Voici l'instance : #<User:0x000055701febc118>"
#jean.show_itself #=> va produire un résultat du genre "Voici l'instance : #<User:0x000055701ff1c978>"