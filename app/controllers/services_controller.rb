class ServicesController < ApplicationController
  before_action :check_login
  before_action :teacher?, only:[:edit, :update, :destroy]
  def index
    sort_direction = params[:sort_order] || "desc"
    sort_field = params[:sort] || "id"
    sort_field = "created_at" if sort_field == "date"
    if params[:type] == "my"
      @services = @self_user.services
    elsif params[:type] == "i_use"
      @services = @self_user.student_services
    else
      @services = Service.all.where("teacher_id != #{@self_user.id}")
    end
    @services = @services.where()
    @services = @services.order(sort_field => sort_direction)



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
