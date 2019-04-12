Feature: Set up scheduled automatic purchases
	    As a property owner
	    So that I can schedule deliveries
        I want to be able to fill out a form with my information

Background: properties in database

  Given the following properties exist:
  | prop_name | tenant_name | tenant_email | address    | frequency | user          |
  | Home      | Jane Doe    | jd@email.com | 4 main st  | 3         | bri@email.com |
  | Beach     | John Doe    | jj@email.com | 7 beach st | 4         | bri@email.com |
  | Lake      | Karen Smith | ks@email.com | 3 lake st  | 2         | bri@email.com |

  Given the following users exist who own properties:
  | first_name | last_name   | email        | password | 
  | Home       | Jane Doe    | jd@email.com | 4mainst  |
  | Beach      | John Doe    | jj@email.com | 7beachst |
  | Lake       | Karen Smith | ks@email.com | 3lakest  |




        Scenario: Viewing order form
            Given I am on the Dashboard page for Jane Doe
            When I click on "Orders"
            Then I should be in the Orders page

        Scenario: Placing an order
            Given I am on the Orders page
            When I fill out correct order information
            And I click on "Submit"
            Then I should see that my order has been placed

        Scenario: Admin login 
            Given I am an Admin
            And I am on the login page
            When I enter Admin login information
            And I click on "Login"
            Then I should be on the Admin Dashboard

        Scenario: Admin updating an order status
            Given I am an Admin
            And I am on the Admin Dashboard
            When I update the status of an order
            Then I should see that reflected in the progress bar

