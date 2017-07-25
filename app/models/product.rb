class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders
  belongs_to :user

  def sale_message
    if price < 30
      return "Discount item!"
    else
      return "Everyday value!"
    end
  end

  def tax
    price * 0.09
  end

  def total
    price * 1.09
  end
end
