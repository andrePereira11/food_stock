class ProductsController < ApplicationController
  def index
    @products = Product.all
    @product_types = ProductType.all
  end

  def new
    @product = Product.new
    @product_types = ProductType.all
  end

  def create
    @product = Product.new(product_params)
    
    if @product.save
      redirect_to @product
    else
      #flash.now[:alert] = 'Nāo foi possível salvar o produto'
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product_types = ProductType.all
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      #flash.now[:alert] = 'Nāo foi possível editar o produto'
      render :update
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to root_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :code, :quantity, :validate_date, :price, :weight, :product_type_id, :brand) 
    end 
end
