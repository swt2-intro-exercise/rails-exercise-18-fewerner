require 'rails_helper'

describe "Authors index page", type: :feature do      

    author = Author.create(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing")

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
        expect(page).to have_link 'Details', href: author_path(author)
    end

    it "should have a link to each author edit page" do
        visit authors_path
        expect(page).to have_link 'Edit', href: edit_author_path(author)
    end

    it "should have a link to delete an author page" do
        visit authors_path
        expect(page).to have_link 'Delete', href: author_path(author)
        
    end

    it 'should have a table listing the full names as well as homepages of autors ' do
        visit authors_path
        expect(page).to have_table 
    end

    it 'should have a table with first and last name in one column called Name' do   
        visit authors_path
        expect(page).to have_css('table th', text: 'Name')
    end

end