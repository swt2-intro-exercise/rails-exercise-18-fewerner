require 'rails_helper'

describe Author, type: :model do

    
    
    it 'should have a first name, last name and a homepage' do
        author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing")
        expect(author.first_name).to eq("Alan")
        expect(author.last_name).to eq("Turing")
        expect(author.homepage).to eq("http://wikipedia.org/Alan_Turing")
                
    end

    it 'name method should return the full name' do
        author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing")
        expect(author.name).to eq("Alan Turing")
    end

    it 'should fail for an authour without a last name' do
        author = Author.new(first_name: "Alan", last_name:"", homepage:"http://example.com")
        expect(author).to_not be_valid
    end

    it 'should have an empty list of papers' do
        author = FactoryBot.create(:author)
        expect(author.papers).to eq([])
    end
end
