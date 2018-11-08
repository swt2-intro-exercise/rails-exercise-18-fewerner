
require 'rails_helper'

describe "New paper page", type: :feature do

    paper = FactoryBot.create(:paper)

    it 'should display the authors of the paper' do
        visit paper_path(paper)

        paper.authors.each do |author|
            expect(page).to have_text  author.name
        end
    end

end