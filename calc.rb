require 'rspec/autorun'

# calc = Calculator.new
# calc.add(5,10)

class Calculator
    def add(a,b)
        a+b
    end

    def factorial(a)
        if a<1
            1
        else
            (1..a).reduce(:*)
        end

    end
end

describe Calculator do
    describe "#add" do
        it "returns the sum of its two arguments" do
            calc = Calculator.new

            expect(calc.add(5,10)).to eq(15)
        end

        it "returns the sum of two different args" do
            calc = Calculator.new

            expect(calc.add(2,3)).to eq(5)
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
end
