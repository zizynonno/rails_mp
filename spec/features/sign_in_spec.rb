require 'rails_helper'

feature 'Sign in' do
  scenario "ログイン成功" do
    user = create(:user) #FactoryBot
    visit root_path
    expect(page).to have_http_status :ok

    click_link "Log in"
    fill_in "Email", with: 'TEST1@example.com'
    fill_in "Password", with: 'foobar'
    click_button "Log in"
    expect(page).to have_selector 'h1', text: user.name
  end

  scenario "ログイン失敗" do
    visit root_path
    expect(page).to have_http_status :ok

    click_link "Log in"
    fill_in "Email", with: 'TESTfaltures@example.com'
    fill_in "Password", with: 'foobarfoobar'
    click_button "Log in"
    expect(page).to have_selector 'h1', text: "Log in"
  end
end

feature 'Sign out' do
  scenario "ログアウト成功" do
    user = create(:user) #FactoryBot
    visit root_path
    click_link "Log in"
    fill_in "Email", with: 'TEST2@example.com'
    fill_in "Password", with: 'foobar'
    click_button "Log in"
    expect(page).to have_selector 'h1', text: user.name
    click_on "Account"
    expect(page).to have_content 'Log out'
    click_on "Log out"
    expect(page).to have_selector 'h1', text: 'Welcome to the Sample App'
    expect(page).to have_current_path root_path
  end
end

# feature 'sign in remember' do
#   scenario "ログイン成功(remember me)" do
#     user = create(:user) #FactoryBot
#     visit root_path
#     log_in_as(user, remember_me: '1')
#     # expect(cookies['remember_token']).not_to be_empty
#   end
# end