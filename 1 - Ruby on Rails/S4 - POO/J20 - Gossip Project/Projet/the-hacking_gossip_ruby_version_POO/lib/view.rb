
class View
  def initialize
    @view = view
  end
  def View.create_gossip
    system 'clear'
    puts "Would you be so kind as to tell us your name?".green
    print "> "
    user_name = gets.chomp
    puts "What do you want to tell us?".green
    print "> "
    user_content = gets.chomp
    return params = {author: user_name, content: user_content}
  end
  def View.index_gossips(all_gossips)
    system 'clear'
    all_gossips.each do |num|
      puts "#{num.author} says :".magenta
      puts "\"#{num.content}\"".yellow
      puts
    end
  end 
  def View.erase_gossips(all_gossips)
    system 'clear'
    all_gossips.each_with_index do |num, idx|
      position = idx +1 
      puts  "gossip n°: #{position}"
      puts "#{num.author} says :".magenta
      puts "\"#{num.content}\"".yellow
      puts
    end
  end
end