def loop_characters(test) 
  if test != 0 
    
    puts "test1 ok"
  else
    puts "test 2 okay"
  end
end


def caesar_cypher(coded_ASCII, encoding_key)
  modified_ASCII = Array.new
  coded_ASCII.each do |current_item|
    
    test = current_item
    loop_characters(test)  
    modified_ASCII << current_item + encoding_key

    end


  modified_ASCII = modified_ASCII.flatten
  puts "#{modified_ASCII}"
  return modified_ASCII
end


def ASCII_to_char(modified_ASCII)
  encoded_code = modified_ASCII.pack('C*')
  puts encoded_code
  return encoded_code
end