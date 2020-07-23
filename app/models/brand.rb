class Brand < ApplicationRecord
    validates :name, uniqueness: { case_sensitive: false }
    has_many :shoes
    has_many :users, through: :shoes 

    accepts_nested_attributes_for :shoes, reject_if: proc {|attr| attr['color'].blank? || attr['price'].blank?}  #shoes_attributes=
end
