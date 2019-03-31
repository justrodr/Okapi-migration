  
  Given("the following properties exist:") do |table|
    listof_properties = table.hashes
    listof_properties.each do |property|
        Property.create!(property)
    end  
  end
  
  
  Given("I am on the Add property page") do
    visit 'properties/new'
  end
  
  Given("I am on the Edit property page") do
    visit 'properties/1/edit'
  end
 
  Then("I should be on the Add property page") do
    assert page.current_path, '/property'
  end

 
  When("I enter valid property information") do
    fill_in 'property[address]', with: "123 Bob st"
    fill_in "Property Name (Optional)", with: "Bob"
    fill_in "Tenant Name", with: "Home"
    fill_in "Tenant Email", with: "Bob@email.com"
  end
 
  Then("I should see the new property in my Dashboard") do
    assert page.has_content?("Bob")
  end
 
  Then("I should be on the Edit property page") do
    assert page.current_path, 'property/edit'
  end

  When("I change tentant information") do
    fill_in "Property Name", with: "Bob"
  end
 
  Then("I should see the edited property in my Dashboard") do
    assert page.current_path, '/dash'
  end

  Then("the property should not be in my table") do
    assert page.has_css?('destroyed')

  end
   