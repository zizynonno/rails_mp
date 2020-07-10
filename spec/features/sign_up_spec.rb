require 'rails_helper'

RSpec.feature 'Sign up' do
  scenario "ユーザー登録を行う" do
    visit root_path
    expect(page).to have_http_status :ok

    click_link "Sign up now!"
    fill_in "Name", with: 'taro'
    fill_in "Email", with: 'foo@example.com'
    fill_in "Password", with: 'test'
    fill_in "Confirmation", with: 'test'
    click_on 'Create my account'
  end
end