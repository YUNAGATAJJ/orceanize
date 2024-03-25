module LoginMacros
  def login_as(user)
    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_on 'Sign IN'
  end
end
