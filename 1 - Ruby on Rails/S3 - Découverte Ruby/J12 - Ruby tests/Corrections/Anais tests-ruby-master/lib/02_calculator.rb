def add(a, b)
    return a+b 
end 

def subtract(a, b)
    return a-b
end

def sum(arr)
    result = 0
    arr.each {|number| result+=number}
    return result
end 

def multiply(a, b)
    return a*b
end

def power(a, b)
    return a**b
end

 def factorial (num)
    fact = 1
    
    i=1
    while i<= num
        fact = fact*i 
        i+=1 
    end 
    return fact
end
        