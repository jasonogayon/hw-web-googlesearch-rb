class GoogleSearchPage

    include PageObject
    
    page_url FigNewton.google_search_url

    # Element Locators
    link(:next, :id => "pnnext")
    elements(:link_results, :xpath => "//div[@class='g']//cite")
    text_field(:textfield_query, :name => "q")

    # Methods
    def search(keyword)

        # Search for a Keyword
        wait_until do self.textfield_query_element.visible? end
        self.textfield_query = keyword
        self.textfield_query_element.send_keys :enter

        # Wait for Results to Appear, then Get Data from results
        results = Array.new
        begin
            tries ||= 20
            wait_until do self.next_element.visible? end
            self.link_results_elements.map do |result| results << result.text end
        rescue
            (tries -= 1).zero? ? fail("Results did not appear after some time. Try again later.") : retry
        end
        return results
    end

end
