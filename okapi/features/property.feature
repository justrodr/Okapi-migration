Feature: Add/Edit property info
	    As a property owner
	    So that I can be able to manage newly acquired homes
	    I want to add a property to the property database

        Scenario: Viewing add property
            Given I am on the Dashboard page
            When I click on "Add"
            Then I should be on the Add property page

        Scenario: Add a property
            Given I am on the Add property page
            When I enter valid property information
            And I click on "Submit"
            Then I should see the new property in my Dashboard

        Scenario: Viewing edit property
            Given I am on the Dashboard page
            When I click on "Edit"
            Then I should be on the Edit property page

        Scenario: Editing a property
            Given I am on the Edit property page
            When I change tentant information
            And I click on "Submit"
            Then I should see the edited property in my Dashboard


            
