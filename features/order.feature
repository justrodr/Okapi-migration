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
  | first_name | last_name | email        | password | admin |
  | Jane       | Doe       | jd@email.com | 4mainst  | 0     |
  | John       | Doe       | jj@email.com | 7beachst | 0     |
  | Karen      | Smith     | ks@email.com | 3lakest  | 0     |
  | Walt       | Disney    | wd@email.com | wedadmin | 1     |



        Scenario: Viewing Subscriptions page
            Given I am on the Dashboard page for Jane Doe
            When I click on "Subscriptions"
            Then I should be on the Subscriptions page

        Scenario: Viewing the Add Subscription page
            Given I am on the Dashboard page for Jane Doe
            When I click on "add123 Bob st"
            Then I should be on the Add Subscription page

        Scenario: Admin login 
            When I am on the login page
            And I enter Admin login information
            And I click on "Log In"
            Then I should be on the Admin Dashboard
