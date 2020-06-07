class ProductsController < ApplicationController

  before_action :only => [:new, :edit] do
    redirect_to new_user_session_path unless :is_admin?
  end

  def index
    @products = Product.all
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    before_action :authenticate_user!
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else 
      render :new
    end
  end

  def edit 
    before_action :authenticate_user!
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
    redirect_to products_path
  end


  private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_orgin)
  end
end