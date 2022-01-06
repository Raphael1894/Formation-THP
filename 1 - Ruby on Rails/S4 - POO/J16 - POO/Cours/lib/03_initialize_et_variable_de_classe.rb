require 'pry'

class User
  attr_accessor :email
  @@user_count = 0

  def initialize(email_to_save)
    @email = email_to_save
    @@user_count = @@user_count + 1
    #puts "On envoie un email de Bienvenue !!"
  end

  def self.count 
    return @@user_count
  end
end

binding.pry
puts "end of file"

#pry commands

#julie = User.new("julie@julie.com") #dès le départ, tu rattaches un email à l'instance et affiche un message
##tu vas avoir un affichage dans le terminal : "On envoie un email de Bienvenue !!"

#julie.email #on vérifie que l’e-mail est bien enregistré. ok, ça retourne => "julie@julie.com"

#jean = User.new #tu vas avoir une erreur car tu as oublié l’e-mail => ArgumentError (wrong number of arguments (given 0, expected 1))

#p User.count #=> 0
#julie = User.new("julie@julie.com")
#p User.count #=> 1
#jean = User.new("jean@jean.com")
#p User.count => 2