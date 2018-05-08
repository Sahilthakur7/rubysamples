module M
    def report
        puts "I am in M"
    end
end

class C
    include M
    def report
        puts "in C"
        super
        puts "Back in C"
    end
end

x = C.new
x.report
