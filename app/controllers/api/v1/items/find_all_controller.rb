class Api::V1::Items::FindAllController < ApplicationController
  def index
    if params[:min_price]
      render json: ItemSerializer.new(Item.find_all_by_price(params[:min_price], nil))
    elsif params[:max_price]
      render json: ItemSerializer.new(Item.find_all_by_price(nil, params[:max_price]))
    end
  end
end