Feature: View Dashboard
    As a property owner
    So I can monitor the status of my rental homes.
    I want to view the dates of previous and future orders and other identifying information.

    Scenario: Seeing my Properties
        Given I am on the Dashboard page
        Then I should see all of my properties

    Scenario: Accessing Contacts 
        Given I am on the Dashboard page
        When I click on Contacts on the sidebar
        Then I should be on my Contacts page

    Scenario: Accessing Payment 
        Given I am on the Dashboard page
        When I click on Payment on the sidebar
        Then I should be on my Payment page

    Scenario: Accessing Orders 
        Given I am on the Dashboard page
        When I click on Orders on the sidebar
        Then I should be on my Orders page

    Scenario: Accessing Contacts 
        Given I am on the Dashboard page
        When I click on Profile on the sidebar
        Then I should be on my Profile page

