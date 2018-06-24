string = ""
start_letter = ""
end_letter = ""
array = []

print "Enter your string:"
string = gets.chomp
array = string.split("")

def start_checker(array,start_letter)
    if(array.first == start_letter)
        puts "True"
    else
        puts "False"
    end
end

def end_checker(array,end_letter)
    if(array.last == end_letter)
        puts "True"
    else
        puts "False"
    end
end


print "Enter the letter you want to check for as starting letter:"
start_letter = gets.chomp

start_checker(array,start_letter)

print "Enter the letter you want to check for as starting letter:"
end_letter = gets.chomp

end_checker(array,end_letter)

