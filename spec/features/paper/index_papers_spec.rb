require 'rails_helper'

describe "Papers index page", type: :feature do      

    paper = FactoryBot.create(:paper)


    it "should render without error" do
        visit papers_path
        expect(page).to have_text("Papers")
    end

    it "should have a link to create a new paper" do
        visit papers_path
        expect(page).to have_link 'New Paper', href: new_paper_path
    end

    it "should have a link to each papers details" do
        visit papers_path
        expect(page).to have_link 'Details', href: paper_path(paper)
    end

    it "should have a link to each author edit page" do
        visit papers_path
        expect(page).to have_link 'Edit', href: edit_paper_path(paper)
    end

    it "should have a link to delete an paper page" do
        visit papers_path
        expect(page).to have_link 'Delete', href: paper_path(paper)
        
    end

    it 'should have a table listing the full names as well as homepages of autors ' do
        visit papers_path
        expect(page).to have_table 
    end

 
end