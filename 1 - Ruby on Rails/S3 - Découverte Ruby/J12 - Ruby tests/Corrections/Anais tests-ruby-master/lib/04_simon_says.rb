def echo (hello)
    return "#{hello}"
end

def shout (hello)
    return "#{hello.upcase}"
end


def repeat (hello, number=2)
    ("#{hello} " *number).delete_suffix!(" ")
end

def start_of_word(s, n)
    s.slice(0, n)
end

def first_word(words)
    words.split.first
end


