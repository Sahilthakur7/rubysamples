require 'rspec'

module RubyContent
    refine String do
        def commentize
            "# #{self}"
        end
    end
end

module CContent
    refine String do
        def commentize
            "// #{self}"
        end
    end
end

class ContentController
    using RubyContent
    def initialize(word)
        @word = word
    end

    def hidden_content
        @word.commentize
    end
end

class CContentController
    using CContent
    def initialize(word)
        @word = word
    end

    def hidden_content
        @word.commentize
    end
end

describe 'refining strings for a specific module' do
    it 'changes the interior of the string method to make it render as a comment in ruby' do
        cc = ContentController.new('My String')
        expect(cc.hidden_content).to eq("# My String")
    end
    it 'changes the interior of the string method to make it render as a comment in C' do
        cc = CContentController.new('My String')
        expect(cc.hidden_content).to eq("// My String")
    end
end
