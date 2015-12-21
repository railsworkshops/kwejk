class CategoriesController < ApplicationController
  expose(:category) { set_category }
  expose(:categories)
  expose(:images) { category.images }

  def create
    if category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def update
    if category.update_attributes(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    category.destroy
    redirect_to categories_path, notice: 'Category was successfully destroyed.'
  end

  private

  def set_category
    if params[:id].present?
      Category.find_by(slug: params[:id])
    else
      Category.new(category_params)
    end
  end

  def category_params
    params.require(:category).permit(:name, :slug, :default) if params[:category]
  end
end
