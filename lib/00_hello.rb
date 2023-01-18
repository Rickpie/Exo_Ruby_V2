def ask_first_name
    puts "quel est ton prénom ? "
    print "> "
    first_name = gets.chomp
    return first_name
end

def say_hello
    puts "bonjour ! #{ask_first_name} "
end


def perform
    say_hello
end


perform