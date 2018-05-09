require "rspec"

class Person
    attr_accessor :name
end

amit = Person.new
karan = Person.new

karan.name = "Karan"
amit.name = "Amit"

class << amit
    def name
        "not available"
    end
end




describe "different instances execute different operations" do
    it "karan first should say his name" do
        expect(karan.name).to eq("Karan")

    end

    it "amit should be hiding his name" do
        expect(amit.name).to eq("not available")
    end
end


# if we want more than one person to hide their name we can create a module and include that module in the singleton classes of all the objects we want to be secretive. As the lookup path goes to the modules included in the singleton classes before it goes to the real class definition, we will get our wanted behavior
