require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "update" do

    it "update" do
      user = create(:user)
      # get edit_user_path(user)
      # get :edit, user
      subject {Proc.new { get :edit, id: 1 }}
      expect(response).to have_http_status(:success)
    end
  end

end
