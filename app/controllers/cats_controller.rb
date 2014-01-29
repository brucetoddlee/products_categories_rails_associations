class CatsController < ApplicationController

  def index
    @cats = Cat.all
  end

  def new
  	@cat = Cat.new
  end

  def create
	current_params = params.require(:cat).permit(:name)
    cat = Cat.create(current_params)
    redirect_to cat
  end

  def show
    id = params.require(:id)
 	@cat = Cat.find(id)
  	@products = @cat.products
  end

  def edit
  	id = params.require(:id)
 	@cat = Cat.find(id)
  end

  def update
  	id = params[:id]
	new_params = params.require(:cat).permit(:name)
	cat = Cat.find(id)
	cat.update(new_params)
	redirect_to cat
  end

  def destroy
 	id = params[:id]
    Cat.destroy(id)
    redirect_to :cats
  end

end

