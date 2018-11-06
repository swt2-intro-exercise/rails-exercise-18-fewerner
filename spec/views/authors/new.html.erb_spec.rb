require 'rails_helper'

RSpec.describe "authors/new.html.erb", type: :view do
  it "should have text inputs for an author's first name, last name, and homepage" do
    visit new_author_path
    
    # these are the standard names given to inputs by the form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end
end
