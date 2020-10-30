class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :update, :destroy]

  def index
    @shops = Shop.all
    json_response(@shops)
  end

  def show
    json_response(@shop)
  end

  def create
    @shop = Shop.create!(shop_params)
    json_response(@shop, :created)
  end

  def update
    if @shop.update!(shop_params)
      render status: 200, json: {
        message: 'Shop successfully updated.'
      }
    end
  end

  def destroy
    if @shop.destroy
      render status: 200, json: {
        message: 'Shop successfully deleted.'
      }
    end
  end

private
  def shop_params
    params.permit(:name, :industry, :logo_url, :slogan)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
  
  
end