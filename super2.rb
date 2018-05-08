class Vehicle
    attr_reader :gears, :wheels, :seats
    def initialize(wheels,age,owner=1)
        @wheels = wheels
        @age = age
        @owner = owner
    end
end

class Bicycle < Vehicle
    def initialize(wheels,age)
        super
        @string = "Hi i am a cycle"
    end

    def properties
        puts @wheels
        puts @age
        puts @owner
        puts @string
    end
end

hero = Bicycle.new(2,3)
hero.properties
