class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(name: params[:category][:name])
    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end
end
