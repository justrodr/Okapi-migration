Feature: User login/Create new user
	As a property owner
	So that I can create and access my account
	I want to manage my properties and information

    Scenario: Creating a new account
        Given I am on the home page
        When I click on Create Account 
        Then I want to be taken to the create account page
    
    Scenario: Login to account
        Given I am on the home page
        When I click on login
        Then I want to be taken to the login page

    Scenario: Invalid Login information
        Given I am on the login page
        When I enter invalid login information
        Then I should see a login error message

    Scenario: Invalid Create Account information
        Given I am on the create account page
        When I enter information that already exists
        Then I should not be able to create an account

    Scenario: Valid Login information
        Given I am on the login page
        When I enter valid login information
        Then I should be on my dashboard

    Scenario: Valid Create Account information
        Given I am on the create account page
        When I enter valid create account information
        Then I should be on my dashboard

