require 'rails_helper'

RSpec.feature 'リンククリック' do
  scenario 'ヘッダーとフッター' do
    # トップページを開く
    visit root_path
    # Homeボタンをクリックする
    click_on 'Home'
    expect(page).to have_current_path "/"
    # Helpボタンをクリックする
    click_on 'Help'
    expect(page).to have_current_path "/help"
    # Aboutボタンをクリックする
    click_on 'About'
    expect(page).to have_current_path "/about"
    # Helpボタンをクリックする
    click_on 'Contact'
    expect(page).to have_current_path "/contact"
  end
end