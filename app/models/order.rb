class Order < ApplicationRecord
  belongs_to :user, optional: true
  # belongs_to :product, optional: true
  has_many :carted_products
  has_many :products, through: :carted_products
  has_many :users, through: :carted_products

  def subtotal
    price
  end

  def tax
    price * 0.09
  end

  def total
    price * 1.09
  end
end
