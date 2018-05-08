require "rspec"

obj = Object.new
object = String.new

def obj.talk
    "Hi"
end

def object.twice
    self + " " + self
end

describe "behavior of obj" do
    it "should say hi" do
        expect(obj.talk).to eq("Hi")
    end
    it "should repeat itself" do
        expect(object.twice).to eq(object + " " + object)
    end
end

