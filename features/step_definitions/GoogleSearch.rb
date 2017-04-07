# Google Search
# -------------

When(/^a Googler searches for the '(.*?)' keyword$/) do |keyword|
    visit GoogleSearchPage
    expect(@browser.title).to eq "Google"
    @results = on(GoogleSearchPage).search(keyword)
end

Then(/^the OneSoftwareTester Wordpress blog link can be found in the first page of Google's search results$/) do
    count = 0
    @results.each do |result|
        count += 1 if result.include? "onesoftwaretester.wordpress.com"
    end
    expect(count).to be > 0
end
