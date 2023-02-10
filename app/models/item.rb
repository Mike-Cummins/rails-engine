class Item < ApplicationRecord
  belongs_to :merchant

  def self.find_all_by_price(min, max)
    where('unit_price >= ?', min).where('unit_price <= ?', max).order(Arel.sql('lower(name)'))
  end
end