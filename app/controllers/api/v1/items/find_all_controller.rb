class Api::V1::Items::FindAllController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.find_all_by_price(params[:min_price], params[:max_price]))
  end
end