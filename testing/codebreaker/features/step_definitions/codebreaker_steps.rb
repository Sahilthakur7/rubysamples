Given /^I am not yet playing$/ do
end

When /^I start a new game$/ do
    game = Codebreaker::Game.new(output_double)
    game.start
end

Then /^I should see "([^"]*)"$/ do |message|
    output_double.messages.should include(message)
end

class OutputDouble
    def messages
        @messages ||= []
    end

    def puts(message)
        messages << message
    end

end

def output_double
    @output_double ||= OutputDouble.new
end
