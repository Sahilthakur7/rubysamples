class C
    def x(vala,recurse=false)
        a = vala
        print "Here's self:"
        p self
        puts "Here's a:"
        puts a

        if recurse
            puts "Recursive call"
            x("2")
            puts "Back after recursion"
            puts a
        end
    end
end

c=C.new
c.x("1", true)
