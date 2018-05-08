module MyModule
    def say
        puts "Hello ladies"
    end
end

class ModuleTester
    include MyModule

end

mt = ModuleTester.new
mt.say
