require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Relationships' do
    it {should belong_to :merchant}
  end
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :unit_price}
    it {should validate_numericality_of :unit_price}
  end
  before :each do
    @item_1 = create(:item, name: "a thing", unit_price: 12.99)
    @item_2 = create(:item, name: "c thing", unit_price: 9.99)
    @item_3 = create(:item, name: "b thing",unit_price: 19.99)
    
  end
  it 'Finds all items by min and max price search, sorted by name' do

    expect(Item.find_all_by_price(10, 20)).to eq([@item_1, @item_3])
  end

  it 'Finds all items by max price only search, sorted by name' do

    expect(Item.find_all_by_price(nil, 20)).to eq([@item_1, @item_3, @item_2])
  end

  it 'Finds all items by min price only search, sorted by name' do

    expect(Item.find_all_by_price(10, nil)).to eq([@item_1, @item_3])
  end  
  
  it 'Finds all items by name search' do

  end
end