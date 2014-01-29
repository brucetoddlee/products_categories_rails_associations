class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    current_params = params.require(:product).permit(:name)
    product = Product.create(current_params)
    redirect_to product
  end

  def show
    id = params.require(:id)
    @product = Product.find(id)
    @cats = @product.cats
  end

  def edit
    id = params[:id]
    @product = Product.find(id)
    @add_cats_options = @product.find_available_cats
    @remove_cats_options = @product.find_assigned_cats
  end

  def update
    id = params[:id]
    new_params = params.require(:product).permit(:name)
    product = Product.find(id)
    product.update(new_params)

    add_cats = []

    unless params[:cats].nil? || params[:cats]["add"].nil?
      params[:cats]["add"].each do |cat|
        cat_object = Cat.where :name => cat
        add_cats << cat_object
      end
    end

    remove_cats = []

    unless params[:cats].nil? || params[:cats]["remove"].nil?
      params[:cats]["remove"].each do |cat|
        cat_object = Cat.where :name => cat
        remove_cats << cat_object
      end
    end

    product.cats << add_cats
    product.cats.destroy(remove_cats)
    redirect_to product
  end

  def destroy
    id = params[:id]
    Product.destroy(id)
    redirect_to :products
  end

end