require 'rspec'
require 'pry'

class Array
    def print_dup
        array_to_return = Array.new
        self.each_with_index do |x,i|
            while i != self.length
                if x == self[i+1]
                    array_to_return << x
                end
                i = i+1

            end
        end

        return array_to_return.uniq

    end

    def remove_dup
        self.each_with_object([]) do |el, arr|
            unless arr.include?(el)
                arr << el
            end
        end
        
    end
end

array = [5,43,5,17,6,5,44]

puts array.print_dup

describe 'Should be able to find the duplicate from an array' do
    it 'should be able to print the element that is duplicate' do
        test_array = [ 5, 43, 5, 17,5, 8]

        expect(test_array.print_dup).to eq([5])
    end

    it 'should be able to print more than one element if duplicate' do
        test_array = [ 5, 43, 5, 17,5, 8, 17, 32, 17, 21, 43]

        expect(test_array.print_dup).to eq([5,43,17])
    end

    it 'should be able to remove duplicate elements' do
        test_array = ["dog", "cat", "dog", "dog", "bull"]

        expect(test_array.remove_dup).to eq(["dog","cat","bull"])
    end
end
