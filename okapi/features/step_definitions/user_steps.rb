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
    /fill_in 'email', with: 'badexample@gmail.com'
    fill_in('password', with: 'failure')/
  end
  
  Then("I should see an error message") do
    /expect(page).to have_content("Invalid email or password")/
  end

  
  