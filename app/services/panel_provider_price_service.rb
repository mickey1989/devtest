require 'net/http'

class PanelProviderPriceService
    @@price = 0

    def initialize
    end

    def calculate_panel_provider_price(panel_provider_id)
        if panel_provider_id == 1
            return calculate_panel_provider_one_price
        elsif panel_provider_id == 2
            return calculate_panel_provider_two_price
        elsif panel_provider_id == 3
            return calculate_panel_provider_three_price
        end
    end

    private

    def calculate_panel_provider_one_price
        uri = URI('http://time.com')
        source = Net::HTTP.get(uri)
        price = source.count('a') / 100
        return price
    end

    def calculate_panel_provider_two_price
        uri = URI('http://openlibrary.org/search.json?q=the+lord+of+the+rings')
        source = Net::HTTP.get(uri)
        JSON.parse(source).each do |item|
            loop_through_array(item)
        end

        return @@price
    end

    def calculate_panel_provider_three_price
        price = 0
        uri = URI('http://time.com')
        source = Net::HTTP.get(uri)
        document = Nokogiri::HTML(source)
        document.traverse do |node|
            price += 1
        end

        return price /100
    end

    def loop_through_array(array)
        if array.count > 10
            @@price += 1
        end
        array.each do |item|
            if item.is_a?(Array) || item.is_a?(Hash)
                loop_through_array(item)
            end
        end
    end
end