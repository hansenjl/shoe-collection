class ShoesController < ApplicationController
    layout 'shoe'

    def index
        @shoes = Shoe.ordered_by_price
    end

    def new
        if params[:brand_id] && @brand = Brand.find_by_id(params[:brand_id])
            @shoe = Shoe.new(brand_id: params[:brand_id])
        else
            @shoe = Shoe.new
            @shoe.build_brand
        end
    end

    def create
       @shoe = Shoe.new(shoe_params)
       if @shoe.save
          #successful
          redirect_to shoe_path(@shoe)
       else
          #redisplay the form

          render :new
       end
    end

    def edit #get
        @shoe = Shoe.find(params[:id])
    end

    def update #patch
        @shoe = Shoe.find(params[:id])
        @shoe.update(shoe_params)
        redirect_to shoe_path(@shoe)
    end

    def show
        @shoe = Shoe.find(params[:id])
    end

    def expensive
        @shoe = Shoe.ordered_by_price.first
    end

    def destroy
        shoe = Shoe.find(params[:id])
        shoe.destroy
        redirect_to shoes_path
    end

    private

    def shoe_params
        params.require(:shoe).permit(:price, :price_confirmation, :color, :limited_edition, :brand_id, brand_attributes: [:name])
    end
end