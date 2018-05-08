require 'pry'
class Person
    attr_accessor :age

    def get_age
        @age = gets.chomp.to_i
    end

    def categorisation
        print_age(@age)
    end

    def print_age(age)
        puts "Its #{age}"
    end
end

x = Person.new
x.get_age
x.categorisation
