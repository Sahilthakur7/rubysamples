require 'rspec'

class Array
    def longest_word
        temp_array = []
        self.each do |el|
            temp_array << el.split(" ")
        end

        temp_array.flatten!
        # temp_array.max {|a,b| a.length <=> b.length} #my implementation
        temp_array.max_by(&:length)
    end
end

#solution by jordan
# class Array
#     def longest_word
#         flat_map(&:split).max_by(&:length)
#     end
# end

describe 'the method returns the longest string in a number of strings jumbled in an array ' do
    it 'returns the longest string in single single words' do
        test_array = ['dob', 'pinnochio', 'lionel', 'messi']
        
        expect(test_array.longest_word).to eq('pinnochio')
    end

    it 'returns the longest string in multi word strings' do
        test_array = ['A sentence', 'broken into several', 'array elements']
        expect(test_array.longest_word).to eq('sentence')
    end
end
