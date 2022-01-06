require 'pry'

class User
  attr_accessor :email
  

   def truc_public
    # un code public
    #on peut faire julie.truc_publique
   end

   private #toute les m"thodes en dessous de cette bamise seront privées.

   def truc_private
    #impossible de faire julie.truc_private
   end

  end
  