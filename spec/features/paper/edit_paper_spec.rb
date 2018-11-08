require 'rails_helper'

describe "papers edit page", type: :feature do 

    paper = FactoryBot.create(:paper)

    it "should render without error" do
        visit edit_paper_path(paper)
    end

     it "should have text inputs for an paper's title, venue, and year" do
        
        visit edit_paper_path(paper)
        
        # these are the standard names given to inputs by the form builder
        expect(page).to have_field('paper[title]')
        expect(page).to have_field('paper[venue]')
        expect(page).to have_field('paper[year]')
    end

    it "should edit the papers database entry when form is submitted" do
        visit edit_paper_path(paper)
        page.fill_in 'paper[title]', with: 'a'
        page.fill_in 'paper[venue]', with: 'b'
        page.fill_in 'paper[year]', with: 'c'
    
        find('input[type="submit"]').click
    
        expect(Paper.exists?(title: 'a', venue: 'b', year: 'c'))
    
    end
    it "should edit the papers database entry when form is submitted" do
        author = Author.create(first_name: 'Peter', last_name: 'Plagiarist', homepage:'')
        count = paper.authors.count
        visit edit_paper_path(paper)

       
        page.find('select#author_ids').select('Peter Plagiarist')
        

        find('input[type="submit"]').click
        
            paper.reload
            expect(paper.authors.count).to eq (count + 1)
            expect(paper.authors).to include(author)
    end
    it "should have a link to paper index page" do
        visit edit_paper_path(paper)
        expect(page).to have_link 'Back', href: papers_path
    end

    it "should have a multiple selectbox" do
        visit edit_paper_path(paper)
        expect(page).to have_css('select[multiple]')
    end
end