require 'pry'

class User

  def update_email(email_to_update)
    @email = email_to_update
  end

  def read_email
    return @email
  end

end

#binding.pry
#puts "end of file"

#pry commands

#julie = User.new
#jean = User.new

#julie.read_email #cette ligne doit te retourner "nil" car par défaut, @email n'existe pas
#jean.read_email  #idem

#julie.update_email("julie@julie.com") #on change la valeur du @email de julie
#jean.update_email("jean@jean.com") #idem pour julien

#puts julie.read_email # tu devrais récupérer cette fois l'email: "julie@julie.com"
#puts jean.read_email # idem avec "jean@jean.com"