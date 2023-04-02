class CartItem < ApplicationRecord
  belongs_to :cart 
  belongs_to :item 
  def total_price
    self.quantity * self.item.price
  end
end
