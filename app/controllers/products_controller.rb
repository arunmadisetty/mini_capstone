class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  
  def index
    sort_attribute = params[:sort_by]
    sort_whichorder = params[:sort_order]
    sort_discount = params[:discounted]
    search = params[:search_term]

    if search
      # @products = current_user.products.where("name ILIKE ?", "%" + search + "%")
      @products = Product.where("name ILIKE ?", "%" + search + "%")

    elsif sort_discount
      # @products = current_user.products.where("price < ?", 20)
      @products = Product.where("price < ?", 20)

    else
      # @products = current_user.products # don't need .all here?
      @products = Product.all

    end

    if sort_attribute && sort_whichorder
      @products = Product.order(sort_attribute => sort_whichorder)
    end

    category_name = params[:category]
    if category_name
      category = Category.find_by(name: category_name)
      @products = category.products
    end

    render "index.html.erb"
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.html.erb"
  end

  def new
    # unless current_user && current_user.admin
    #   redirect_to "/knicksgear"
    #   return
    # end
    @newproduct = Product.new
    @suppliers = Supplier.all
    render "new.html.erb"
  end

  def create
    # unless current_user && current_user.admin
    #   redirect_to "/knicksgear"
    #   return
    # end
    @newproduct = Product.new(
      name: params[:form_name],
      price: params[:form_price],
      #image: params[:form_image],
      description: params[:form_description]
    )
    # The following if statement will check if the Product can be saved, and if it can it will continue, otherwise it will return to the new.html.erb page.
    if @newproduct.save
      Image.create(
        url: params[:image],
        product_id: @products.id
      )
      #render "create.html.erb"
      flash[:success]="New product added."
      redirect_to "/knicksgear"
    else
      # These lines are an attempt to recreate the contents of the new method. We render (as opposed to redirect) because we don't want the page to refresh and lose our data.
      @suppliers = Supplier.all
      render "new.html.erb"
    end
  end

  def edit
    # unless current_user && current_user.admin
    #   redirect_to "/knicksgear"
    #   return
    # end
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "edit.html.erb"
  end

  def update
    # unless current_user && current_user.admin
    #   redirect_to "/knicksgear"
    #   return
    # end
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.name = params[:form_name]
    @product.price = params[:form_price]
    #@product.image = params[:form_image]
    @product.description = params[:form_description]
    @product.save
    #render "update.html.erb"
    flash[:success]="Product successfully updated."
    redirect_to "/knicksgear/#{@product.id}"
  end

  def destroy
    # unless current_user && current_user.admin
    #   redirect_to "/knicksgear"
    #   return
    # end
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    #render "destroy.html.erb"
    flash[:danger]="Product deleted."
    redirect_to "/knicksgear"
  end
  
end
