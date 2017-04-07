Feature: Google Search

    @onesoftwaretester
    Scenario: Search for One Software Tester blog using the 'onesoftwaretester' keyword
        When a Googler searches for the 'onesoftwaretester' keyword
        Then the OneSoftwareTester Wordpress blog link can be found in the first page of Google's search results
