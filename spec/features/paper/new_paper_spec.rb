require 'rails_helper'

describe "New paper page", type: :feature do

  it "should render withour error" do
   visit new_paper_path
  end

  it "should have text inputs for an Title, venue and year" do
    visit new_paper_path
    
    # these are the standard names given to inputs by the form builder
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end

  it "should create a database entry whith title venue and year when paper form is submitted" do
    visit new_paper_path

    page.fill_in 'paper[title]', with: 'COMPUTING MACHINERY AND INTELLIGENCE'
    page.fill_in 'paper[venue]', with: 'Mind 49: 433-460'
    page.fill_in 'paper[year]', with: '1950'

    find('input[type="submit"]').click

    expect(Paper.exists?(title: 'COMPUTING MACHINERY AND INTELLIGENCE', venue: 'Mind 49: 433-460', year: '1950'))

  end

end