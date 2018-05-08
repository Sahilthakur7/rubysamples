require 'spec_helper'

module Codebreaker
    describe Game do
        describe "#start" do
            it 'sends a welcome message' do
                output_double = double('output')
                game = Game.new(output_double)
                expect(output_double).to receive(:puts).with('Welcome To Codebreaker')
                game.start
            end

            it 'prompts for the first guess' do
                output_double = double('output')
                game = Game.new(output_double)

                expect(output_double).to receive(:puts).with('Enter guess:')
                game.start
            end
        end
    end
end
