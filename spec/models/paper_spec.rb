require 'rails_helper'


describe Paper, type: :model do

    
    
    it 'should have a title, venue and year' do
        paper = FactoryBot.create(:paper)
        expect(paper.title).to eq("COMPUTING MACHINERY AND INTELLIGENCE")
        expect(paper.venue).to eq("Mind 49: 433-460")
        expect(paper.year).to eq(1950)
                
    end

    it 'should have an empty list of authors given a paper without an author' do
        paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950)
        expect(paper.authors).to eq([])
    end

    it 'should fail for a paper without a title, venue or year' do
        paper = Paper.new(title: "", venue:"", year:"")
        expect(paper).to_not be_valid
    end

    it 'should fail for year that is not an integer ' do
        paper = Paper.new(title: "", venue:"", year:"eleven")
        expect(paper).to_not be_valid
    end
end