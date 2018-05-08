require 'rspec'

describe "Adding bubble sort method to Array class" do
    it "properly sorts the array" do
        test_array = [14,6,23,4,55]
        expect(test_array.bubble_sort).to eq(test_array.sort)
    end
end

class Array
    def bubble_sort
        n = self.length

        loop do
            swapped = false

            (n-1).times do |i|
                if self[i] > self[i+1]
                    self[i], self[i+1] = self[i+1], self[i]
                    swapped = true
                end
            end

            break if not swapped
        end

        self
    end
end
