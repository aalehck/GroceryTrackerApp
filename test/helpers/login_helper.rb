module LoginHelper
  def login(username: default_username, password: default_password)
    visit '/login'
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    click_on 'Login'
  end

  def default_username
    "Joe"
  end
  def default_password
    "password"
  end
  def default_password_digest
    BCrypt::Password.create(default_password, cost: 4)
  end
end
