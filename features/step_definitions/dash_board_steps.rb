Given("I am on the Dashboard page") do
    visit dash_path
  end
  
  Then("I should see a table of my properties") do
    assert page.has_css?('table')
  end

  Then("I should be on my Contacts page") do
    assert page.current_path, 'contacts_page'
  end
   
  Then("I should be on my Payment page") do
    assert page.current_path, 'payment_page'
  end
  
  Then("I should be on my Orders page") do
    assert page.current_path, 'orders_page'
  end
  
  Then("I should be on my Profile page") do
    assert page.current_path, 'profiles_page'
  end