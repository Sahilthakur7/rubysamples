puts "Enter your temperature in celsius"
cel = gets.to_i
fahren = (cel * (9/5.0)) + 32
puts "The value is #{fahren} in fahrenheits"

cel2 = File.read("temp.dat")
cel2 = cel2.to_i
fahren2 = (cel2 * (9/5.0)) + 32
puts fahren2

fh = File.new("temp.out", "w")
fh.puts fahren2
fh.close
