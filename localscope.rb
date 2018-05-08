a = 0

def t
    puts "Top level method t"
end

class C
    a=1
    def self.x
        a=2
        puts "C.x; a= #{a}"
    end

    def x
        a=3
        puts "C.new.x; a= #{a}"
    end

    puts "class #{a}"
end

puts "#{a}"
c = C.new
c.x
C.x
