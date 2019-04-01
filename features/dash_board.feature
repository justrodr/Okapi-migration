Feature: View Dashboard
    As a property owner
    So I can monitor the status of my rental homes.
    I want to view the dates of previous and future orders and other identifying information.
 
  Background: users in database
  Given the following users exist for dash:
  | first_name | last_name   | email        | password | 
  | Home       | Jane Doe    | jd@email.com | 4mainst  |
  | Beach      | John Doe    | jj@email.com | 7beachst |
  | Lake       | Karen Smith | ks@email.com | 3lakest  |

    Scenario: Seeing my Properties
        Given I am on the Dashboard page
        Then I should see a table of my properties

    Scenario: Accessing Contacts 
        Given I am on the Dashboard page
        When I click on "Contact"
        Then I should be on my Contacts page

    Scenario: Accessing Payment 
        Given I am on the Dashboard page
        When I click on "Payment"
        Then I should be on my Payment page

    Scenario: Accessing Orders 
        Given I am on the Dashboard page
        When I click on "Order"
        Then I should be on my Orders page

    Scenario: Accessing Contacts 
        Given I am on the Dashboard page
        When I click on "Profile"
        Then I should be on my Profile page
        
    Scenario: Editing My Account
        Given I am on the Profile page
        And I enter valid update information
        And I click on "Update Account"
        Then I should be on the dashboard page

