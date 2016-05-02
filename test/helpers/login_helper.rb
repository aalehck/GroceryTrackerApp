module LoginHelper
  def create_user(username: default_username, password: default_password, email: default_email)
    visit '/signup'
    fill_in 'Username', with: username
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Confirmation', with: password
    click_on 'Submit'
  end
  alias_method :signup_and_login, :create_user

  def login(username: default_username, password: default_password)
    visit '/login'
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    click_on 'Login'
  end

  def default_username
    "Joe"
  end
  def default_email
    'joe@example.com'
  end
  def default_password
    "password"
  end
  def default_password_digest
    BCrypt::Password.create(default_password, cost: 4)
  end
end
