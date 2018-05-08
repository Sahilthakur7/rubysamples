require 'rspec'

describe "sentence reverser" do
    it "reverses the words of the sentence, not characters" do
        test_sentence = "Big bad bolingoli"
        expect(sentence_reverser(test_sentence)).to eq("bolingoli bad Big")
    end
end

def sentence_reverser(sentence)
    holding_array = sentence.split(" ")
    final_string = String.new
    holding_array.reverse.each do |word|
        final_string << word + " "
    end

    final_string.chop
end

def given_solution(sentence)
    sentence.split.reverse.join(" ")
end
