class ServicesController < ApplicationController
  layout Proc.new { |controller| controller.request.xhr? ? false : 'application' }
  before_action :check_login
  before_action :teacher?, only:[:edit, :update, :destroy]
  def index
    @sort_direction = params[:sort_order] || "asc"
    @sort_field = params[:sort] || "id"
    @sort_type = params[:type] || "all"
    if @sort_field == "date"
      @sort_field = "created_at"
    end
    if @sort_field == "rating"
      @sort_field = "created_at"
    end

    ###############
    @subjects = []
    @categories = []
    if !params[:categories]
      @categories = Category.all
    else
      params[:categories].each do |c|
        @categories.push(Category.find(c))
      end
    end
    if !params[:subjects]
      @categories.each do |c|
        c.subjects.each do |s|
          @subjects.push(s)
        end
      end
    else
      params[:subjects].each do |s|
        @subjects.push(Subject.find(s))
      end
    end
    ################


    if @sort_type == "my"
      @services = @self_user.services
    elsif @sort_type == "i_use"
      @services = @self_user.student_services
    elsif @sort_type == "other"
      @services = Service.all.where("teacher_id != #{@self_user.id}")
    elsif @sort_type == "all"
      @services = Service.all
    else
      @services = Service.all.where(teacher_id: @sort_type)
    end
    @services = @services.order(@sort_field => @sort_direction)
  end

  def index_short
    index
    render partial:"layouts/services", locals: {services: @services}
  end


  def new
    @service = Service.new
  end

  def create

    @service = Service.create(
        name: params[:service][:name],
        price: params[:service][:price],
        description: params[:service][:description],
        subject_id: params[:service][:subject_id],
        teacher_id: current_user,
    )

    if @service.errors.any?
      render 'new'
    else
      redirect_to service_path(@service.id)
    end
  end
  def edit
    @service = Service.find(params[:id])
  end
  def update
    @service =Service.update(params[:id],
                        name: params[:service][:name],
                        price: params[:service][:price],
                        description: params[:service][:description],
                        subject_id: params[:service][:subject_id]
    )
    if @service.errors.any?
      render 'edit'
    else
      redirect_to service_path(@service[:id])
    end
  end

  def destroy
    Service.find(params[:id]).delete

  end

  def show
    @service = Service.find(params[:id])
  end

  def teacher?
    @service = Service.find(params[:id])
    if @service.teacher != @self_user
      redirect_to service_path(@service.id)
    end
  end
end
