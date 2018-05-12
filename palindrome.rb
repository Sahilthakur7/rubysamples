require 'rspec'

def is_palindrome?(string)
    str = string.to_s.downcase
    if(str == str.reverse)
        return true
    else
        return false
    end
    
    # Solution by Jordan
    # string.downcase == string.downcase.reverse
end

describe 'is a palindrome' do
    it 'returns true for same case palindrome' do
        test_string = 'kasak'
        expect(is_palindrome?(test_string)).to eq(true)
    end

    it 'returns true for different case palindrome' do
        test_string = 'Kasak'
        expect(is_palindrome?(test_string)).to eq(true)
    end

    it 'returns false for not a palindrome' do
        test_string = 'amit'
        expect(is_palindrome?(test_string)).to eq(false)
    end
end

