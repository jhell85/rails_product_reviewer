class ProductsController < ApplicationController

  before_action :only => [:new, :create, :edit, :destroy] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end

  def index
    @products = Product.all
    if params[:g]
      render :list
    else
      @most_reviews = Product.most_reviews
      @recently_added = Product.recently_added
      render :index
    end
  end

  def list
    @products = Product.all
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else 
      render :new
    end
  end

  def edit 
    @product = Product.find(params[:id])
    render :edit
  end

  def show 
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy 
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "#{@product.name} has been destroyed."
    redirect_to products_path
  end


  private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_orgin)
  end
end