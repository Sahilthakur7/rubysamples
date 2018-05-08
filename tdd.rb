require 'rspec/autorun'

class Calculator

    def factorial(num)
        if num < 1
            1
        else
            (1..num).reduce(:*)
        end
    end
end

describe "#factorial" do
    it "returns 1 when given 0" do
        calc = Calculator.new

        expect(calc.factorial(0)).to eq(1)
    end

    it "returns 120 when given 5" do
        calc = Calculator.new

        expect(calc.factorial(5)).to eq(120)
    end
end


