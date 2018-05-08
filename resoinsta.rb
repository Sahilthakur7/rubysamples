class C
    def show_var
        @v = "Raju"
        p @v
        show_var2
    end
    @v = "Vengaboys"
    puts @v
    def show_var2
        p @v
    end

    def self.show_var
        p @v
    end
end

c = C.new
c.show_var
C.show_var

