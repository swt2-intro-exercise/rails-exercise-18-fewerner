require 'rails_helper'

describe "Authors index page", type: :feature do

    it "should render without error" do
        expect(page).to have_text("Authors")
    end

    it "should have a link to create a new author" do
        expect(page).to have_link 'New author', href: new_author_path
    end

    it "should have a link to each authors details" do
        expect(page).to have_link 'Show Details', href: author_path(@author)

    end

    it 'should have a table listing the full names as well as homepages of autors ' do
        expect(page).to have_table 'First Name'

    end

end