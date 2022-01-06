require "pry"

class User
  attr_writer :mastercard #Permet d'écire sans lire
  attr_reader :birthdate  #Permet delire sans écrire
  attr_accessor :email



  def read_mastercard
    return @mastercard
  end


  def update_birthdate(birthdate_to_update)
    @birthdate = birthdate_to_update
  end
end

binding.pry
puts "end of file"

#pry commands

#julie = User.new

#julie.mastercard = "4242 4242 4242 4242" # va sauvegarder cette valeur dans la variable de l'instance julie
#julie.mastercard # retourne une erreur : on ne peut pas lire la variable facilement
#julie.read_mastercard # on a créé une méthode spécifique pour la lire. Ici ça retourne bien : => "4242 4242 4242 4242"

#julie.update_birthdate("06/01/1991") #Cette méthode permet de rattacher la date de naissance à l'instance => Date de naissance sauvegardée !

#julie.birthdate # on arrive bien à lire la variable. Ça retourne : => "06/01/1991"
#julie.birthdate = "06/01/1991" #là on a une erreur. Impossible de la modifier ainsi