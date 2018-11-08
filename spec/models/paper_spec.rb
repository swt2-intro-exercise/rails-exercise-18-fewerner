require 'rails_helper'


describe Paper, type: :model do

    
    
    it 'should have a title, venue and year' do
        paper = FactoryBot.create(:paper)
        expect(paper.title).to eq("COMPUTING MACHINERY AND INTELLIGENCE")
        expect(paper.venue).to eq("Mind 49: 433-460")
        expect(paper.year).to eq(1950)
                
    end

    it 'should fail for a paper without a title, venue or year' do
        paper = Paper.new(first_name: "", last_name:"", homepage:"")
        expect(paper).to_not be_valid
    end

    it 'should fail for year that is not an integer ' do
        paper = Paper.new(first_name: "", last_name:"", homepage:"eleven")
        expect(paper).to_not be_valid
    end
end