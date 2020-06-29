require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "return http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #contact" do
    it "return http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end

end

RSpec.feature 'タイトル' do
  background do
    @base_title = 'Rails_MP'
  end
  scenario 'タイトル' do
    visit root_path
    expect(page).to have_title "#{@base_title}"
    visit help_path
    expect(page).to have_title("Help | #{@base_title}", exact: true)
    visit about_path
    expect(page).to have_title("About | Rails_MP", exact: true)
    visit contact_path
    expect(page).to have_title("Contact | Rails_MP", exact: true)
  end
end