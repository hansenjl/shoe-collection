class BrandsController < ApplicationController

    def new
        @brand = Brand.new
    end

    def create
        @brand = Brand.new(brand_params)
        if @brand.save
            redirect_to brand_path(@brand)
        else
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
        params.require(:brand).permit(:name)
    end
end