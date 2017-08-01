class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    user_shopping_cart = current_user.carted_products.where(status: "carted")
    
    subtotal = 0
    tax = 0
    total = 0
    user_shopping_cart.each do |carted_product|
      # new_carted_product = CartedProduct.find_by(id: params[:form_product_id])
      subtotal_single = carted_product.product.price * carted_product.quantity
      tax_single = subtotal * 0.09
      total_single = subtotal * 1.09
      subtotal += subtotal_single
      tax += tax_single
      total += total_single
    end
      
    order = Order.create(
      user_id: current_user.id,
      # product_id: params[:form_product_id],
      # quantity: params[:form_quantity],
      subtotal: subtotal,
      tax: tax,
      total: total
    )

    # find_order_id = current_user.orders.find_by(:id)
    user_shopping_cart.each do |carted_product|
      carted_product.update(status: "purchased", order_id: order.id)
    end

    redirect_to "/orders/#{order.id}"
  end

  def show
    render "show.html.erb"
  end

end
