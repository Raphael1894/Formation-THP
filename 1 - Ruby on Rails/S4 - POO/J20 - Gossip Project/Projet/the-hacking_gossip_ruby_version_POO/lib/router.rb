require_relative 'controller.rb'
require_relative 'gossip.rb'
require_relative 'view.rb'
require 'pry'

class Router
  def intialize
    @controller = Controller.new
  end
  def perform 
    puts "BIENVENUE DANS THE GOSSIP PROJECT"
    while true
      puts
      puts "Tu veux faire quoi jeune mouss' ?"
      puts "1. Je veux créer un gossip".blue
      puts "2. Je veux lire des gossips".green
      puts "3 .Souhaites-tu effacer un gossip?".cyan
      puts "4. Je veux quitter l'app"
      params = gets.chomp.to_i
      case params 
      when 1
        puts "Tu as choisi de créer un gossip" 
        @controller.create_gossip
      when 2
        puts "Tu as choisi de lire des gossip" 
        @controller.index_gossip
      when 3
        puts "Tu as choisi de'effacer un gossip"
        @controller.erase_gossip  
      when 4
        puts "À bientôt !"
        break 
      else
        puts "Ce choix n'existe pas, merci de ressayer" 
      end
    end
  end
end
