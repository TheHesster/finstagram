def fizz_buzz(start_num, end_num)
    num = start_num
    while num < end_num
        if num % 3 == 0
            if num % 5== 0
                puts "FizzBuzz"
            else
                puts "Fizz"
            end
        elsif num % 5 == 0
            puts "Buzz"
        else
            puts num
        end
    num += 1
    end
end

fizz_buzz(1,100)