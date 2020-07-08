class Shoe < ApplicationRecord

    def self.ordered_by_price
        #self.all.sort_by{|shoe| shoe.price}.last
        self.order(price: :desc)
        
    end


    def brand_and_color
        "#{self.brand} - #{self.color}"
    end

    def display_price
        split_price = self.price.to_s.split(".")
        if split_price[1].length == 1
            split_price[1] << "0"
        elsif split_price[1].length == 0
            split_price[1] << "00"
        end
        display = split_price.join(".")
        "$#{display}"
    end
end
