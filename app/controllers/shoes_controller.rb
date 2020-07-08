class ShoesController < ApplicationController

    def index
        @shoes = Shoe.ordered_by_price
    end

 
    def show
        @shoe = Shoe.find(params[:id])
    end

    def expensive
        @shoe = Shoe.ordered_by_price.first
    end
end