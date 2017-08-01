class Product < ApplicationRecord
  has_many :category_products  
  has_many :categories, through: :category_products
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :users, through: :carted_products
  validates :name, :presence => true
  validates :price, :presence => true, :numericality => true


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
