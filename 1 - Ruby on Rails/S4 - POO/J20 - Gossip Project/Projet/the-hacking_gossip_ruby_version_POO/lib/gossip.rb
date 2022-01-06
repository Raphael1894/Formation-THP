require "csv"

class Gossip
  attr_reader :author, :content, :array_freedom
  def initialize(params)
    author = params[:author]
    content = params[:content]
    @author = author
    @content= content
  end
  def save
    CSV.open("db/gossip.csv", "a+") do |csv|
      #csv << [params[:author], params[:content]]
      puts "author save : #{author}"
    puts "content save : #{content}"
      csv << [@author, @content]
    end
  end
  def self.all
    all_gossips = Array.new
    csv = CSV.open("db/gossip.csv")
    csv.each do |ligne|
      params = {author: ligne[0], content: ligne[1]}
      gossip_provisoire = Gossip.new(params)
      all_gossips << gossip_provisoire
    end
    return all_gossips
  end
  def self.erase(all_gossips)
    puts "Voici la liste de gossip, lequel souhaite tu effacer?".green
    print "> "
    user_erase_choice = gets.chomp.to_i - 1
    csv = CSV.open("db/gossip.csv", "a+")
    csv.each_with_index do |num, idx|
      if idx == user_erase_choice

        all_gossips[idx] = nil
        all_gossips = all_gossips.compact
      end
    end
    puts "#{all_gossips}"
    all_gossips.each do |gossip_to_write|
      CSV.open("db/gossip.csv", "w") do |csv|
        all_gossips.each do |re_write|
          csv << [re_write.author, re_write.content] 
        end
      end
    end
  end
end
