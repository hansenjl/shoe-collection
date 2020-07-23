class Shoe < ApplicationRecord
    validates :price, :color, presence: true
    validates :price,  numericality: {greater_than: 0, message: "must be of some value, silly!"}
    validates :color, uniqueness: {scope: :price, message: "with that price has already been added"}
    # validates :price, confirmation: true, on: :create
    # validates :price_confirmation, presence: true
    validates :color, two_word: true
    belongs_to :brand   #brand & brand= method
    belongs_to :user
    # accepts_nested_attributes_for :brand

    def brand_attributes=(attr)
        # find or create a brand with the name passed in
        if !attr[:name].blank?
            self.brand= Brand.find_or_create_by(name: attr[:name])
        end
        # associate that brand to this shoe
    end

    scope :ordered_by_price, -> { order(price: :desc) }
    scope :cheap_shoes, ->(price) {where('price < ?', price)}

    # def self.ordered_by_price
    #     #self.all.sort_by{|shoe| shoe.price}.last
    #     self.order(price: :desc)
    # end

    def brand_and_color
        "#{self.brand.try(:name)} - #{self.color}"
    end

end
