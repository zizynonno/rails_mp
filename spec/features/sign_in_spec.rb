require 'rails_helper'

feature 'Sign in' do
  scenario "ログインする" do
    user = create(:user)
    visit root_path
    expect(page).to have_http_status :ok

    click_link "Log in"
    fill_in "Email", with: 'test@example.com'
    fill_in "Password", with: 'foobar'
    # click_on "Log in"
    # expect(page).to have_content "ログインしました。"
  end
end