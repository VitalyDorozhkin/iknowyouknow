class CategoriesController < ApplicationController
  before_action :admin?, only:[:new, :create, :edit, :update]
  def index
    @categories = Category.all
  end
  def new
    @category = Category.new
  end
  def create
    @category = category.create(
        name: params[:category][:name],
        description: params[:category][:description]
    )

    if @category.errors.any?
      render 'new'
    else
      redirect_to category_path(@subject.id)
    end
  end
  def edit
    @category = Category.find(params[:id])
  end
  def update
    @category = Category.update(params[:id],
                              name: params[:category][:name],
                              description: params[:category][:description]
    )
    if @category.errors.any?
      render 'edit'
    else
      redirect_to category_path(@category[:id])
    end
  end

  def destroy
    Category.find(params[:id]).delete
    go_to_user
  end

  def show
    @category = Category.find(params[:id])
  end
end


