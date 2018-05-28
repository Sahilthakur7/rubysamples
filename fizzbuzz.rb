require 'rspec'

class FizzBuzz
    def self.start
        100.times do |number|
            if(number%3 == 0 && number%5 == 0)
                return "FizzBuzz"
            elsif(number%5 == 0)
                return "Buzz"
            elsif(number%3 == 0)
                return "Fizz"
            end
        end

        # A very good solution
        # 1.upto(100) do |num|
        #     x = ''
        #     x+= 'Fizz' if num%3 == 0
        #     x+= 'Buzz' if num%5 == 0
        #     puts (x.empty? ? num : x)
        # end
    end

    def self.test_on_number(number)
            if(number%3 == 0 && number%5 == 0)
                return "FizzBuzz"
            elsif(number%5 == 0)
                return "Buzz"
            elsif(number%3 == 0)
                return "Fizz"
            end
    end
end

describe 'fizzbuzz program' do
    xit 'returns 1 to 100, fizz on 3 multiples, buzz on 5 multiples and fizzbuzz on multiples of both' do
        expect(FizzBuzz.start).to eq()
    end
    
    it 'returns Buzz on 10' do
         expect(FizzBuzz.test_on_number(10)).to eq("Buzz")
    end

    it 'returns fizz on 9' do
         expect(FizzBuzz.test_on_number(9)).to eq("Fizz")
    end

    it 'returns fizzbuzz on 30' do
         expect(FizzBuzz.test_on_number(30)).to eq("FizzBuzz")
    end
end
