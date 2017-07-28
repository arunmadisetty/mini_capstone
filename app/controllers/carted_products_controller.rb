class CartedProductsController < ApplicationController
  def index
    @carted_products = current_user.carted_products

    render "index.html.erb"
  end

  def create
    # new_carted_product = Product.find_by(id: params[:form_product_id])
    # subtotal = new_carted_product.price * params[:form_quantity].to_i
    # tax = subtotal * 0.09
    # total = subtotal * 1.09

    carted_product = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:form_product_id],
      quantity: params[:form_quantity],
      status: "carted"
    )
    redirect_to "/carted_products"
  end
end
