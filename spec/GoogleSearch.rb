require_relative 'helpers/spec_hooks'
require File.absolute_path('..', File.dirname(__FILE__)) + '/features/support/pages/GoogleSearch'

describe "a Googler searches for the 'onesoftwaretester' keyword", onesoftwaretester: true, chrome:true do

    fit "the OneSoftwareTester Wordpress blog link can be found in the first page of Google's search results" do

        # Visit Google Search
        visit GoogleSearchPage
        expect(@browser.title).to eq "Google"

        # Search for Desired Keyword
        @results = on(GoogleSearchPage).search("onesoftwaretester")

        # Assertion 
        count = 0
        @results.each do |result| count += 1 if result.include?("onesoftwaretester.wordpress.com") end
        expect(count).to be > 0
    end

end