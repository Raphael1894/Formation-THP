#require_relative 'routeur.rb'
require_relative 'gossip.rb'
require_relative 'view'

class Controller
  def initialize
    @view = View.new
    puts "created view"
  end
  def @controller.create_gossip
    params = View.create_gossip
    gossip = Gossip.new(params)
    gossip.save
  end
  def @controller.index_gossip
    all_gossips = Gossip.all
    View.index_gossips(all_gossips)
  end
 def @controller.erase_gossip  
  all_gossips = Gossip.all
  View.erase_gossips(all_gossips)
  Gossip.erase(all_gossips)
 end
end

