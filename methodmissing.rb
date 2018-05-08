class Whatever
    def method_missing(arg)
        "#{arg} has #{arg.length} letters!"
    end
end
