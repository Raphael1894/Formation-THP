#max loop number
def max_number
  final_number = 1000
  return final_number
end

#is multiple?
def is_multiple_of_3_or_5?(test)
    if test % 3 == 0 or test % 5 == 0
     
      return true
    else
      puts "#{test} is not a multiple of 3 or 5"

      return false
    end 
end 

#main loop
def sum_of_3_or_5_multiples(final_number)
  final_sum = 0 
  puts final_number 
  current_number = 0
    loop do 
      if current_number == final_number 
        break
      else
        test = current_number
      if is_multiple_of_3_or_5?(test)  
        final_sum = final_sum + current_number
        puts "Added #{current_number} to final sum"
      end
      current_number = current_number + 1
    end
  end
  return final_sum 
end

#perform
def perform
  final_number = max_number
  final_sum = sum_of_3_or_5_multiples(final_number)
  puts "The final sum is equal to #{final_sum}"
end

perform

