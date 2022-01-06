require 'colorize'

def greeting
  puts `clear`
  puts "--*-- Welcome to this Caesar Cipher. --*--".colorize(:color => :blue, :background => :white)
  sleep 2
  puts `clear`
end

def coding_key
  loop do 
    puts "To get started, give us your encoding key" 
    print ">"
    encoding_key = gets.chomp
      if encoding_key =~ /^-?[0-9]+$/
        sleep 1
        puts `clear`
        puts "key saved, key entered : #{encoding_key}"
        sleep 2
        puts `clear`
        encoding_key = encoding_key.to_i
        return encoding_key
        break
      else
        puts "Invalid input. Only numbers are accepted"
        sleep 1
        puts `clear` 
      end
  end 
end

def coding_string
  loop do 
    puts "Now, tell us what you want to encrypt."
    print ">"
    encoding_string = gets.chomp
      if encoding_string =~ /\A[a-zA-Z ]+\Z/
        sleep 1
        puts `clear`
        puts "code saved, code entered : #{encoding_string}"
        sleep 2
        puts `clear`
        return encoding_string
        break
      else
        puts "Invalid input. Only letters and spaces are accepted"
        sleep 1
        puts `clear` 
      end
  end 

end

def char_to_ASCII(encoding_string)
  coded_ASCII = Array.new
  coded_ASCII << encoding_string.bytes
  coded_ASCII = coded_ASCII.flatten
  #puts "#{coded_ASCII}"
  return coded_ASCII
end

def caesar_cypher(coded_ASCII, encoding_key)
  modified_ASCII = Array.new
  coded_ASCII.each do |current_item|
    current_item = current_item.to_i
    if current_item == 32 
      ready_to_modify = current_item - encoding_key
    elsif current_item.between?(65, 90) 
      if current_item + encoding_key > 90
        ready_to_modify = current_item - 26
      else
        ready_to_modify = current_item
      end
    elsif current_item.between?(97, 122) 
      if current_item + encoding_key > 122
        ready_to_modify = current_item - 26
      else
        ready_to_modify = current_item
      end
    end 
    modified_ASCII << ready_to_modify + encoding_key
  end

  modified_ASCII = modified_ASCII.flatten
  #puts "#{modified_ASCII}"
  return modified_ASCII
end

def ASCII_to_char(modified_ASCII)
  encoded_code = modified_ASCII.pack('C*')
  return encoded_code
end

def coding_code(encoded_code)
  puts "Starting to encode"
  sleep 1
  100.times {|p| print "\rAnalysing %#{p+1}..."; sleep 0.02}
  puts""
  puts "sentence coded"
  sleep 1
  puts `clear`
  puts "Here is your encrypted code : #{encoded_code}"
  sleep 1.5
end

def start_again
puts "Do you want to start again? Press 1 to restart."
print ">"
menuChoice = gets.chomp.to_i
    if menuChoice == 1
      puts "Let's begin"
      sleep 1   
    else
      sleep 0.2
      puts `clear`
      abort("Have a nice day")
    end
end

def perform
  loop do
    greeting
    encoding_key = coding_key
    encoding_string = coding_string
    coded_ASCII = char_to_ASCII(encoding_string)
    ready_to_modify = 0
    modified_ASCII = caesar_cypher(coded_ASCII, encoding_key)
    encoded_code = ASCII_to_char(modified_ASCII)
    coding_code(encoded_code)
    start_again
  end
end

perform