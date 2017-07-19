class ProductsController < ApplicationController
  def index
    sort_attribute = params[:sort_by]
    sort_whichorder = params[:sort_order]
    sort_discount = params[:discounted]
    search = params[:search_term]

    if search
      @products = Product.where("name ILIKE ?", "%" + search + "%")

    elsif sort_attribute && sort_whichorder
      @products = Product.all.order(sort_attribute => sort_whichorder)

    elsif sort_discount
      @products = Product.where("price < ?", 20)

    else
      @products = Product.all

    end

    render "index.html.erb"
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    newproduct = Product.new(
      name: params[:form_name],
      price: params[:form_price],
      image: params[:form_image],
      description: params[:form_description]
    )
    newproduct.save
    #render "create.html.erb"
    flash[:success]="New product added."
    redirect_to "/knicksgear"
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "edit.html.erb"
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.name = params[:form_name]
    @product.price = params[:form_price]
    @product.image = params[:form_image]
    @product.description = params[:form_description]
    @product.save
    #render "update.html.erb"
    flash[:success]="Product successfully updated."
    redirect_to "/knicksgear/#{@product.id}"
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    #render "destroy.html.erb"
    flash[:danger]="Product deleted."
    redirect_to "/knicksgear"
  end

end
