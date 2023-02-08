require 'rails_helper'

RSpec.describe 'Merchant Items API' do
  before :each do
    create(:merchant)
    @merchant = Merchant.first
    @items = create_list(:item, 3, merchant_id: @merchant.id)
  end

  it 'Sends a list of all items for a merchant' do
    get "/api/v1/merchants/#{@merchant.id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)
    
    expect(items[:data].count).to eq(3)

    expect(items[:data][0]).to have_key(:id)
    expect(items[:data][0][:id]).to be_a(String)

    expect(items[:data][0]).to have_key(:type)
    expect(items[:data][0][:type]).to be_a(String)

    expect(items[:data][0]).to have_key(:attributes)
    expect(items[:data][0][:attributes]).to be_a(Hash)

    expect(items[:data][0][:attributes]).to have_key(:name)
    expect(items[:data][0][:attributes][:name]).to be_a(String)

    expect(items[:data][0][:attributes]).to have_key(:description)
    expect(items[:data][0][:attributes][:description]).to be_a(String)

    expect(items[:data][0][:attributes]).to have_key(:unit_price)
    expect(items[:data][0][:attributes][:unit_price]).to be_a(Float)

    expect(items[:data][0][:attributes]).to have_key(:merchant_id)
    expect(items[:data][0][:attributes][:merchant_id]).to be_a(Integer)
  end
end