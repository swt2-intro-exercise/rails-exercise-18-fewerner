require 'rails_helper'

describe "Authors index page", type: :feature do      
    before :all do
        @author = FactoryBot.create(:author)
    end

    it "should render without error" do
        visit authors_path
        expect(page).to have_text("Authors")
    end

    it "should have a link to create a new author" do
        visit authors_path
        expect(page).to have_link 'New Author', href: new_author_path
    end

    it "should have a link to each authors details" do
        visit authors_path
        expect(page).to have_link 'Details', href: author_path(@author)
    end

    it 'should have a table listing the full names as well as homepages of autors ' do
        visit authors_path
        expect(page).to have_table 

    end

end