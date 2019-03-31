Feature: Add/Edit property info
	    As a property owner
	    So that I can be able to manage newly acquired homes
	    I want to add a property to the property database

Background: properties in database

  Given the following properties exist:
  | prop_name | tenant_name | tenant_email | address    | frequency | user          |
  | Home      | Jane Doe    | jd@email.com | 4 main st  | 3         | bri@email.com |
  | Beach     | John Doe    | jj@email.com | 7 beach st | 4         | bri@email.com |
  | Lake      | Karen Smith | ks@email.com | 3 lake st  | 2         | bri@email.com |


        Scenario: Viewing add property
            Given I am on the Dashboard page
            When I click on "Add New Property"
            Then I should be on the Add property page

        Scenario: Add a property
            Given I am on the Dashboard page
            When I click on "Add New Property"
            And I enter valid property information
            And I click on "Add Property"
            Then I should see the new property in my Dashboard

        Scenario: Viewing edit property
            Given I am on the Dashboard page
            When I click on "editbutton Lake"
            Then I should be on the Edit property page

        Scenario: Editing a property
            Given I am on the Edit property page
            When I change tentant information
            And I click on "Save Changes"
            Then I should see the edited property in my Dashboard

        Scenario: Deleting a property
            Given I am on the Dashboard page
            When I click on "deletebuttonLake"
            Then the property should not be in my table 
