def yellow_pager(str)
    if str.length == 10
        phone_num = []
        str.downcase.split('').each do |n|
            if n == "a" || n == "b" || n == "c"
                phone_num.push "2"
            elsif n == "d" || n == "e" || n == "f"
                phone_num.push "3"
            elsif n == "g" || n == "h" || n == "i"
                phone_num.push "4"
            elsif n == "j" || n == "k" || n == "l"
                phone_num.push "5"
            elsif n == "m" || n == "n" || n == "o"
                phone_num.push "6"
            elsif n == "p" || n == "q" || n == "r" || n == "s"
                phone_num.push "7"
            elsif n == "t" || n == "u" || n == "v"
                phone_num.push "8"
            elsif n == "w" || n == "x" || n == "y" || n == "z"
                phone_num.push "9"
            end
        end
    puts phone_num.join()
    else
        false
    end
end

yellow_pager("gdhBYTbyth")