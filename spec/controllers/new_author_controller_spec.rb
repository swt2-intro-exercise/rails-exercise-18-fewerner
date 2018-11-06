require 'rails_helper'

RSpec.describe NewAuthorController, type: :controller do

  describe "GET #new_author_page" do
    it "returns http success" do
      get :new_author_page
      expect(response).to have_http_status(:success)
    end
  end

end
