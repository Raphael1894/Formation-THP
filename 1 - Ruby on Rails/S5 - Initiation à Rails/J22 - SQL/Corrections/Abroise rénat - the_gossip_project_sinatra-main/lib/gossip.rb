require 'csv'

class Gossip
    attr_reader :content, :author

    def initialize(author, content)
      @author = author
      @content = content
    end

    def save
        file = CSV.open("db/gossip.csv", "ab")  
        #mettre dans une boucle 
        file.add_row([@author, @content])

        file.close
    end

    def self.all
      all_gossips = []
      CSV.read("./db/gossip.csv").each do |csv_line|
        all_gossips << Gossip.new(csv_line[0], csv_line[1])
      end
      return all_gossips
    end
    
end
