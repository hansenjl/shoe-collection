class ShoesController < ApplicationController
    before_action :find_shoe, :redirect_if_not_owner, only: [:show, :edit, :update, :destroy]
    layout 'shoe'

    def index
        # is this a nested route?
        if params[:brand_id] && @brand = Brand.find_by_id(params[:brand_id])
            @shoes = @brand.shoes.ordered_by_price
             # if so, we want only shoes of that brand
        else #if not, show all the shoes
            @shoes = Shoe.ordered_by_price.cheap_shoes(120)
        end
    end

    def new
        if params[:brand_id] && @brand = Brand.find_by_id(params[:brand_id])
            # instantiate a shoe that knows about @brand
            # @shoe = Shoe.new(brand_id: params[:brand_id])
            # @shoe.brand = @brand
            @shoe = @brand.shoes.build
        else
            @shoe = Shoe.new
            @shoe.build_brand
        end
    end



    def create
       @shoe = current_user.shoes.build(shoe_params)
       if @shoe.valid?
            @shoe.save
          #successful
          redirect_to shoe_path(@shoe)
       else
          #redisplay the form
          @brand = Brand.find_by_id(params[:brand_id]) if params[:brand_id]

          render :new
       end
    end

    def edit #get


    end

    def update #patch
        if @shoe.update(shoe_params)
            redirect_to shoe_path(@shoe)
        else
            render :edit
        end
    end

    def show

    end

    def expensive
        @shoe = Shoe.ordered_by_price.first
    end

    def destroy
        @shoe.destroy
        redirect_to shoes_path
    end

    private

    def shoe_params
        params.require(:shoe).permit(:price, :price_confirmation, :color, :limited_edition, :brand_id, brand_attributes: [:name])
    end

    def find_shoe
        @shoe = Shoe.find(params[:id])
    end

    def redirect_if_not_owner
        if @shoe.user != current_user
            redirect_to user_path(current_user), alert: "You can't edit this shoe!"
        end
    end

end