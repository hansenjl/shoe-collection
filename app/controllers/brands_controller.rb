class BrandsController < ApplicationController

    def new
        @brand = Brand.new
        3.times { @brand.shoes.build }
    end

    def create
        @brand = Brand.new(brand_params)
        if @brand.save
            redirect_to brand_path(@brand)
        else
            while @brand.shoes.length < 3
                @brand.shoes.build
             end
            render :new
        end
    end

    def show
        @brand = Brand.find(params[:id])
    end

    def index
        @brands = Brand.all
    end

    private

    def brand_params
        params.require(:brand).permit(:name, shoes_attributes: [:price, :color, :limited_edition])
    end
end