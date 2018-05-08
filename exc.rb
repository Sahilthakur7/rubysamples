print "Enter a number: "
n = gets.to_i
begin
    result =  100/n
rescue
    puts "0 mt daal bhosdu"
    exit
end

puts result
