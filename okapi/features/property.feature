Feature: Add/Edit property info
	    As a property owner
	    So that I can be able to manage newly acquired homes
	    I want to add a property to the property database

        Scenario: Viewing add property
            Given I am on the Dashboard page
            And I click on Add property
            Then I should be on the Add property page

        Scenario: Add a property
            Given I am on the Add property page
            When I submit in correct property information
            Then I should see the new property in my Dashboard

        Scenario: Viewing edit property
            Given I am on the Dashboard apge
            When I click on Edit property
            Then I should be on the Edit property page

        Scenario: Editing a property
            Given I am on the Edit property page
            When I submit changes to tentant information
            Then I should see the edited property in my Dashboard


            
