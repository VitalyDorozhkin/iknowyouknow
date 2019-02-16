class CategoriesController < ApplicationController
  before_action :admin?, only:[:new, :create, :edit, :update, :destroy]
  def index
    if params[:sort] == "my"
      @categories  = @self_user.teacher_categories
    elsif params[:sort] == "i_use"
      @categories = @self_user.student_categories
    else
      @categories = Category.all
    end
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.create(
        name: params[:category][:name],
        description: params[:category][:description]
    )

    if @category.errors.any?
      render 'new'
    else
      redirect_to category_path(@category.id)
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


