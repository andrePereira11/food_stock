class ProductsController < ApplicationController
  def index
    @products = Product.search(params[:search])
    @product_types = ProductType.all
  end

  def new
    @product = Product.new
    @product_types = ProductType.all
  end

  def create
    @product = Product.new(product_params)

    if @product.validate_date
      is_usual(@product) ? @product.usual! : @product.expiring!
      # OU @product.status = :usual
    end
    
    if @product.save
      flash[:notice] = 'Cadastrado com sucesso!'
      redirect_to @product
    else
      #flash[:alert] = 'Nāo foi possível salvar o produto'
      @product_types = ProductType.all
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
      is_usual(@product) ? @product.usual! : @product.expiring!     #Precisa atualizar o status depois de dar update
      redirect_to @product, notice: 'Atualizado com sucesso!'
    else
      #flash[:notice] = 'Nāo foi possível editar o produto'
      @product_types = ProductType.all
      render :edit
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
    
    def is_usual(product)
      product.validate_date > DateTime.now + 30 ? true : false      #Verifica se a data de validade é superior a 1 mes a partir de hoje
    end
end
