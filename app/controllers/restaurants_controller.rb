class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    json_response(@restaurants)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    json_response(@restaurant)
  end

  def create
    @restaurant = Restaurant.create!(restaurant_params)
    json_response(@restaurant, :created)
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update!(restaurant_params)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
  end

private
  def restaurant_params
    params.permit(:name, :kind, :description, :review)
  end

  def json_response(object, status=:ok)
    render json: object, status: status
  end
  
end