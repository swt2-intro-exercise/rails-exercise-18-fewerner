describe "Authors edit page", type: :feature do 

it "should render withour error" do
    author = Author.create(first_name:'Alan', last_name: 'Turing', homepage: 'http://example.com')
    visit edit_author_path(author)
   end
end