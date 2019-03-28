  Given("I am on the home page") do
    visit root_path
  end
  
  When("I click on Create Account") do
    ("Create Account")
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
    fill_in 'EMAIL', with: 'badexample@gmail.com'
    fill_in 'PASSWORD', with: 'failure'
    click_on("Log In")
  end
  
  Then("I should see a login error message") do
    assert page.current_path, '/login'
    assert page.has_css?(".alert-danger", wait: 3)
  end

  Given("I am on the create account page") do
    visit 'users/new'
  end
  
  #When("I enter information that already exists") do
    #pending # Write code here that turns the phrase above into concrete actions
  #end
  
  Then("I should not be able to create an account") do
    assert page.current_path, 'users/new'
    assert page.has_css? "Account already exists for this email"
  end

  #When("I enter valid login information") do
  #  pending # Write code here that turns the phrase above into concrete actions
  #end
  
  Then("I should be on my dashboard") do
    assert page.current_path, '/dash'
  end
  
  When("I enter valid create account information") do
    fill_in 'FIRSTNAME', with: 'Good'
    fill_in 'LASTNAME', with: 'Example'
    fill_in 'EMAIL', with: 'goodexample@gmail.com'
    fill_in 'PASSWORD', with: 'success'
    fill_in 'CONFIRM PASSWORD', with: 'success'
    click_on("Sign Up")
  end



  

  
  