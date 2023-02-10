require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Relationships' do
    it {should belong_to :merchant}
  end

  it 'Finds all items by price search' do
    item_1 = create(:item, unit_price: 12.99)
    item_2 = create(:item, unit_price: 9.99)
    item_3 = create(:item, unit_price: 19.99)
    
    expect(Item.find_all_by_price(10, 20)).to eq([item_1, item_3])
  end
end