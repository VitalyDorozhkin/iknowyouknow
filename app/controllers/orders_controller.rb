class OrdersController < ApplicationController
  before_action :check_login
  def index
    if params[:sort] == "teacher"
      @orders = User.find_by_id(@self_user).teacher_orders
    end
    if params[:sort] == "student"
      @orders = User.find_by_id(@self_user).orders
    end
    if @orders == nil
      redirect_to user_path(@self_user.id)
    end


  end
  def new
    @order= Order.new
    @service_id = params[:service_id]
  end
  def create

    @order = Order.create(
        service_id: params[:order][:service_id],
        comment: params[:order][:comment],
        student_id: current_user,
        )

    if @order.errors.any?
      render 'new'
    else
      redirect_to service_path(@order.teacher.id)
    end
  end


  def destroy
    Order.find(params[:id]).delete

  end

  def show
    @order = Order.find(params[:id])
  end
end
