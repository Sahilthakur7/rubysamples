require 'rspec'

describe "position_filter" do
    it "lines up players with their appropriate positions" do
        test_positions = ['CF','CAM','CB']
        test_players = ['Bolingoli', 'Mata', 'Jones']
        test_players_2 = ['Kun', 'Silva', 'Stones']
        expect(position_filter(test_positions,test_players,test_players_2).first).to eq(['CF','Bolingoli','Kun'])
    end
end

def position_filter(positions,*players)
    positions.zip(*players)
end
