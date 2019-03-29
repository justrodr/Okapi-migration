Then("I should be on the Add property page") do
  assert page.current_path, 'users/new'
  #fix
end

Given("I am on the Add property page") do
  visit root_path
  #fix
end

When("I enter valid property information") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see the new property in my Dashboard") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should be on the Edit property page") do
  assert page.current_path, 'users/new'
  #fix
end

Given("I am on the Edit property page") do
  visit root_path
  #fix
end

When("I change tentant information") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see the edited property in my Dashboard") do
  pending # Write code here that turns the phrase above into concrete actions
end