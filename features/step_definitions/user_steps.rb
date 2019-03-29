  Given("I am on the home page") do
    visit root_path
  end
<<<<<<< HEAD:okapi/features/step_definitions/user_steps.rb
 
=======
  
  When("I click on Create Account") do
    ("Create Account")
  end
  
>>>>>>> 3e45bd35a70384a01233a58cca582540dae9ebfd:features/step_definitions/user_steps.rb
  Then("I want to be taken to the create account page") do
    assert page.current_path, 'users/new'
  end
  
  When(/^I click on "([^"]*)"$/) do |arg1|
    click_on(arg1)
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
  end
  
  Then("I should see a login error message") do
    assert page.current_path, '/users/sign_in'
  end

  Given("I am on the create account page") do
    visit 'users/new'
  end
  
  Then("I should not be able to create an account") do
    assert page.current_path, 'users/new'
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
  end