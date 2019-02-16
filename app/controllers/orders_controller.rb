class OrdersController < ApplicationController
  before_action :check_login
  def index
    if params[:sort] == "i_use"
      @orders = User.find_by_id(@self_user).teacher_orders

    elsif params[:sort] == "my"
      @orders = User.find_by_id(@self_user).orders
    elsif admin?
      @orders = Order.all
    end

    go_to_user if @orders == nil


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
      redirect_to service_path(@order.service_id)
    end
  end


  def destroy
    Order.find(params[:id]).delete

  end

  def show
    @order = Order.find(params[:id])
  end
end
