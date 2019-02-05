class ServicesController < ApplicationController
  before_action :check_login
  before_action :teacher?, only:[:edit, :update, :destroy]
  def index
    @services = Service.all
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
