module SupportModule
  # setup
  def is_logged_in?
    !session[:user_id].nil?
  end

  def login_as(user)
    visit root_path
    click_link "Log in"
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end
end

RSpec.configure do |config|
  config.include SupportModule
end