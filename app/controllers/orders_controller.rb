class OrdersController < ApplicationController
  def create
    new_order = Product.find_by(id: params[:form_product_id])
    subtotal = new_order.price * params[:form_quantity].to_i
    tax = subtotal * 0.09
    total = subtotal * 1.09

    order = Order.create(
      user_id: current_user.id,
      # product_id: params[:form_product_id],
      # quantity: params[:form_quantity],
      subtotal: subtotal.round(2),
      tax: tax.round(2),
      total: total.round(2)
    )
    render "create.html.erb"
  end


end
