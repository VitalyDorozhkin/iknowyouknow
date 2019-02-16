class SubjectsController < ApplicationController
  before_action :admin?, only:[:new, :create, :edit, :update, :destroy]
  def index
    if params[:sort] == "my"
      @subjects = @self_user.teacher_subjects
    elsif params[:sort] == "i_use"
      @subjects = @self_user.student_subjects
    else
      @subjects = Subject.all
    end
  end
  def new
    @subject = Subject.new
  end
  def create
    @subject = Subject.create(
        name: params[:subject][:name],
        description: params[:subject][:description],
        category_id: params[:subject][:category_id]
    )

    if @subject.errors.any?
      render 'new'
    else
      redirect_to subject_path(@subject.id)
    end
  end
  def edit
    @subject = Subject.find(params[:id])
  end
  def update
    @subject = Subject.update(params[:id],
                        name: params[:subject][:name],
                        description: params[:subject][:description]
    )
    if @subject.errors.any?
      render 'edit'
    else
      redirect_to subject_path(@subject[:id])
    end
  end

  def destroy
    Subject.find(params[:id]).delete
    go_to_user
  end

  def show
    @subject = Subject.find(params[:id])
  end
end
