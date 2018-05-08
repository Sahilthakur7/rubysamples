module Codebreaker
    class Game
        def initialize(output)
            @output = output
        end

        def start
            @output.puts 'Welcome To Codebreaker'
            @output.puts 'Enter guess:'
        end
    end
end
