class Shoe < ApplicationRecord

    def self.ordered_by_price
        #self.all.sort_by{|shoe| shoe.price}.last
        self.order(price: :desc)

    end


    def brand_and_color
        "#{self.brand} - #{self.color}"
    end

end
