require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Relationships' do
    it {should belong_to :merchant}
  end
  before :each do
    @item_1 = create(:item, unit_price: 12.99)
    @item_2 = create(:item, unit_price: 9.99)
    @item_3 = create(:item, unit_price: 19.99)
    
  end
  it 'Finds all items by min and max price search' do

    expect(Item.find_all_by_price(10, 20)).to eq([@item_1, @item_3])
  end

  it 'Finds all items by max price only search' do

    expect(Item.find_all_by_price(nil, 20)).to eq([@item_1, @item_2, @item_3])
  end
end