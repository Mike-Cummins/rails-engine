require 'rails_helper'  

describe 'Items API' do
  it "Sends a list of all items" do
    create_list(:item, 3)
    merchant = create(:merchant)
    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)
  
    # expect(items[:data].count).to eq(3)
    
    # items[:data].each do |item|
    #   expect(item).to have_key(:id)
    #   expect(item[:id]).to be_an(String)

    #   expect(item).to have_key(:type)
    #   expect(item[:type]).to be_a(String)

    #   expect(item).to have_key(:attributes)
    #   expect(item[:attributes]).to be_a(Hash)
    #   expect(item[:attributes][:name]).to be_a(String)
   
  end
end
