#marche pas 
def who_is_bigger(number1, number2, number3)
    if number1.nil? || number2.nil? || number3.nil?
       return "nil detected" 
    else
        h={"a"=>number1, "b"=>number2, "c"=>number3}
        key=h.key(h.values.max)
        return "#{key} is bigger"
end
end
   




def reverse_upcase_noLTA(words)
    return words.upcase.reverse.delete"LTA"
end
    

