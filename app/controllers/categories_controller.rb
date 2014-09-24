class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    if Category.create(entry_params)
      flash[:success] = "Awesome!"
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    else
      flash[:error] = "Failure"
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end
  end

  def entry_params
    # contest id should not be permitted, it should be set by the system
    params.require(:category).permit(
    :name => []
    )
  end
end
