  Given("I am on the home page") do
    visit root_path
  end
  
  When("I click on Create Account") do
    click_on("Create Account")
  end
  
  Then("I want to be taken to the create account page") do
    assert page.current_path, 'users/new'
  end
  
  When("I click on login") do
    click_on("Login")
  end
  
  Then("I want to be taken to the login page") do
    assert page.current_path, '/login'
  end


  Given("I am on the login page") do
    visit "/login"
  end
  
  When("I enter invalid login information") do
    fill_in 'Email', with: 'badexample@gmail.com'
    fill_in 'Password', with: 'failure'
    click_on("Log In")
  end
  
  Then("I should see a login error message") do
    assert page.current_path, '/login'
    assert page.has_css?(".alert-danger", wait: 3)
  end

  Given("I am on the create account page") do
    visit 'users/new'
  end
  
  Then("I should not be able to create an account") do
    assert page.current_path, 'users/new'
    assert page.has_css? "Account already exists for this email"
  end
  
  Then("I should be on my dashboard") do
    assert page.current_path, '/dash'
  end
  
  When("I enter valid create account information") do
    fill_in 'First Name', with: 'Good'
    fill_in 'Last Name', with: 'Example'
    fill_in 'Email Address', with: 'goodexample@gmail.com'
    fill_in 'Password', with: 'success'
    fill_in 'Confirm Password', with: 'success'
    click_on("Sign Up")
  end



  

  
  