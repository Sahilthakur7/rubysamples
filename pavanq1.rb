string = ""
substring = ""
puts "Enter your string."
string = gets.chomp
puts "#{string} is your string"

puts "Enter the substring you want to check for"
substring = gets.chomp
puts "#{substring} is the substring you want to check in #{string}"

array = string.split("")
array2 = substring.split("")


i =0
array_for_starting_letter = []

while(i != array.length)
    if(array[i] == array2[0])
        array_for_starting_letter << i
        i= i + 1
    else
        i = i + 1
    end
end

if(array_for_starting_letter.count == 0)
    puts "false"
end

def checking(i,array,array2)
    result = true
    j=0
    while(i != array.length)
        while(array[i] != array2[0])
            i = i+1
        end
        while(j != array2.length)
            if(array[i] == array2[j])
                i=i+1
                j=j+1
            else
                result = false
                break
            end
        end
        break
    end
    return result
end


array_for_starting_letter.each do |element|
    res = false
    res = checking(element,array,array2)
    if(res == true)
        puts "TRUE"
        break
    end
end

