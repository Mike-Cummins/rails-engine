class Item < ApplicationRecord
  belongs_to :merchant

  validates_numericality_of :unit_price
  validates_presence_of :name, :description, :unit_price

  def self.max_unit_price
    Item.maximum(:unit_price)
  end
  
  def self.find_all_by_price(min, max)
    max = max_unit_price if max.nil?
    min = 0 if min.nil?
    Item.where('unit_price >= ?', min).where('unit_price <= ?', max).order(Arel.sql('lower(name)'))
  end
end