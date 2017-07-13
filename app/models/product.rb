class Product < ApplicationRecord
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
