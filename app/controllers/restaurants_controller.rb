class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :update, :destroy]

  def index
    @restaurants = Restaurant.all
    if params[:page]
      @restaurants = Restaurant.all.page(params[:page])
    end
    json_response(@restaurants)
  end

  def show
    json_response(@restaurant)
  end

  def create
    @restaurant = Restaurant.create!(restaurant_params)
    json_response(@restaurant, :created)
  end

  def update
    if @restaurant.update!(restaurant_params)
      render status: 200, json: {
        message: 'Restaurant successfully updated.'
      }
    end
  end

  def destroy
    if @restaurant.destroy
      render status: 200, json: {
        message: 'Restaurant successfully deleted.'
      }
    end
  end

  def random
    @restaurant = Restaurant.all.sample
    json_response(@restaurant)
  end

  def search
    @restaurants = Restaurant.search(params[:name], params[:kind])
    if params[:page]
      @restaurants = Restaurant.search(params[:name], params[:kind]).page(params[:page])
    end
    json_response(@restaurants)
  end

private
  def restaurant_params
    params.permit(:name, :kind, :description, :review)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
  
end