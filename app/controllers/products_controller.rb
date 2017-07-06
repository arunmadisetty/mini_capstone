class ProductsController < ApplicationController
  def products_method
    @products = Contact.all
    render "products.html.erb"
end
