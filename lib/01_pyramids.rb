def number_step
    puts "Combien d'étage pour ta pyramide ? ( entre 1 et 25) "
    loop do 
        print "> "
        user_number = gets.chomp.to_i
        if user_number < 1 || user_number > 25 
           puts "j'ai dis entre 1 et 25 connard"
        else
            return user_number
        end
    end
end

def full_pyramid (user_number, isreversed)
    if !isreversed
        for num in 1..user_number do
            (user_number-num).times {print ' '}
            num.times{print "#"}
            (num - 1).times{print "#"}
            puts
        end
    else         
        for num in 1..user_number do
            num2 = user_number -num
            (user_number-num2).times {print ' '}
            num2.times{print "#"}
            (num2 - 1).times{print "#"}
            puts
        end
    end
end

def draw_pyramid
    full_pyramid(number_step,false)
end

def draw_full_pyramid
    num = number_step
    full_pyramid(num,false)
    full_pyramid(num,true)    
end

draw_full_pyramid