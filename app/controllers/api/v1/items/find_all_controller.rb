class Api::V1::Items::FindAllController < ApplicationController
  def index
    require 'pry'; binding.pry
    render json: ItemSerializer.new(Item.find_all_by_price())
  end
  
end