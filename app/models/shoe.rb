class Shoe < ApplicationRecord
    validates :price, :color, presence: true
    validates :price,  numericality: {greater_than: 0, message: "must be of some value, silly!"}
    validates :color, uniqueness: {scope: :price, message: "with that price has already been added"}
    validates :price, confirmation: true, on: :create
    validates :price_confirmation, presence: true
    validates :color, two_word: true


    def self.ordered_by_price
        #self.all.sort_by{|shoe| shoe.price}.last
        self.order(price: :desc)
    end


    def brand_and_color
        "#{self.brand} - #{self.color}"
    end

end
