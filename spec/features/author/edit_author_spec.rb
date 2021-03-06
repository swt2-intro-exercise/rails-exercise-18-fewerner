require 'rails_helper'

describe "Authors edit page", type: :feature do 

    author = FactoryBot.create(:author)

    it "should render withour error" do
        visit edit_author_path(author)
    end

     it "should have text inputs for an author's first name, last name, and homepage" do
        
        visit edit_author_path(author)
        
        # these are the standard names given to inputs by the form builder
        expect(page).to have_field('author[first_name]')
        expect(page).to have_field('author[last_name]')
        expect(page).to have_field('author[homepage]')
    end

    it "should edit the authors database entry with firstname lastname and hompage when form is submitted" do
        visit edit_author_path(author)
        page.fill_in 'author[first_name]', with: 'Alan'
        page.fill_in 'author[last_name]', with: 'Mathison'
        page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    
        find('input[type="submit"]').click
    
        expect(Author.exists?(first_name: 'Alan', last_name: 'Mathison', homepage: 'http://wikipedia.org/Alan_Turing'))
    
    end
    it "should have a link to author index page" do
        visit edit_author_path(author)
        expect(page).to have_link 'Back', href: authors_path
    end


end