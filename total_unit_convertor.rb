require 'rspec/autorun'

#UnitConvertor.new.convert(2,:cup,:liter) # => 0.473
#UnitConvertor.new.convert(2,:cup,:gram) # => DimensionMismatchError
DimensionalMismatchError = Class.new(StandardError)

Quantity = Struct.new(:amount, :unit)

class UnitConvertor
    def initialize(initial_quantity,destination)
       @initial_quantity = initial_quantity 
       @destination = destination 
    end

    def convert
        Quantity.new(
        @initial_quantity.amount * conversion_factor(from: @initial_quantity.unit,to: @destination), @destination)
    end

    private

    CONVERSION_FACTORS = {
        liter: {
            cup: 4.226775,
            liter: 1,
           pint: 2.11338 
        },
        gram: {
            gram: 1,
            kilogram: 0.001
        }
    }

    def conversion_factor(from:, to:)
        dimension = common_dimension(from,to)
        unless dimension.nil?
        CONVERSION_FACTORS[dimension][to] / CONVERSION_FACTORS[dimension][from] 
        else
            raise(DimensionalMismatchError, "Cant convert")

        end
    end

    def common_dimension(from,to)
        CONVERSION_FACTORS.keys.find do |conversion_factor|
            CONVERSION_FACTORS[conversion_factor].keys.include?(from) && 
                CONVERSION_FACTORS[conversion_factor].keys.include?(to)
        end
    end
end


describe UnitConvertor do
    describe "#convert" do
        it "translates between the same dimensioins" do
            quant = Quantity.new(2,:cup)
            convertor = UnitConvertor.new( quant, :liter)

            result = convertor.convert

            expect(result.amount).to be_within(0.001).of(0.473)
            expect(result.unit).to eq(:liter)
        end

        it "can convert in same dimension" do
            quant = Quantity.new(2,:cup)
            convertor = UnitConvertor.new( quant, :cup)

            result = convertor.convert

            expect(result.amount).to eq(2)
            expect(result.unit).to eq(:cup)

        end

        it "raises an error in different dimensions" do
            quant = Quantity.new(2,:cup)

            convertor = UnitConvertor.new(quant, :gram)

            expect { convertor.convert}.to raise_error(DimensionalMismatchError)
        end
    end
end
