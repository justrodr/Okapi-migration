Feature: User login/Create new user
	As a property owner
	So that I can create and access my account
	I want to manage my properties and information

    Scenario: Creating a new account
        Given I am on the home page
        When I click on "Create Account" 
        Then I want to be taken to the create account page
    
    Scenario: Login to account
        Given I am on the home page
        When I click on "Login"
        Then I want to be taken to the login page

    Scenario: Invalid Login information
        Given I am on the login page
        When I enter invalid login information
        And I click on "Log In"
        Then I should see a login error message

    Scenario: Valid Create Account information
        Given I am on the create account page
        When I enter valid create account information
        And I click on "Sign Up"
        Then I should be on my dashboard

