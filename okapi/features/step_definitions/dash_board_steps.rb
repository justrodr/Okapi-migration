Given("I am on the Dashboard page") do
    visit "/dash"
  end
  
  Then("I should see all of my properties") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  When("I click on Contacts on the sidebar") do
    click_on("Contact")
  end
  
  Then("I should be on my Contacts page") do
    assert page.current_path, 'contacts_page'
  end
  
  When("I click on Payment on the sidebar") do
    click_on("Payment")
  end
  
  Then("I should be on my Payment page") do
    assert page.current_path, 'payment_page'
  end
  
  When("I click on Orders on the sidebar") do
    click_on("Order")
  end
  
  Then("I should be on my Orders page") do
    assert page.current_path, 'orders_page'
  end
  
  When("I click on Profile on the sidebar") do
    click_on("Profile")
  end
  
  Then("I should be on my Profile page") do
    assert page.current_path, 'profiles_page'
  end