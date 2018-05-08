require 'quantity'

class UnitConvertor
    def initialize(initial_quantity,destination,conversion_database)
       @initial_quantity = initial_quantity 
       @destination = destination 
       @conversion_database = conversion_database
    end

    def convert
        Quantity.new(
            amount: initial_quantity.amount * conversion_ratio, unit: destination
        )
    end

    private

    attr_reader :conversion_database, :initial_quantity, :destination

    def conversion_ratio(from:, to:)
        conversion_database.conversion_ratio(from: initial_quantity.unit,
                                            to: destination)
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
