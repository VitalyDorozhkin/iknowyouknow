class UsersController < ApplicationController
  before_action :check_login, only: [ :show, :edit, :update, :destroy]
  before_action :check_no_login, only: [:sign_up, :new, :create]
  before_action :admin?, only: [:index]
  before_action :init_user
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create

    @user = User.create(
        name: params[:user][:name],
        lastname: params[:user][:lastname],
        age: params[:user][:age],

        email: params[:user][:email],
        phone: params[:user][:phone],
        login: params[:user][:login],
        password: params[:user][:password],

        description: params[:user][:description]
    )

    if @user.errors.any?
      render 'new'
    else
      login(@user.login)
      redirect_to user_path(@user.id)
    end
  end
  def edit

  end
  def update

  end

  def destroy
    User.find(params[:id]).delete
  end

  def show
    @user = User.find(params[:id])
  end

  def sign_up

  end

  def sign_out
    session[:user_id] = nil
    redirect_to sign_up_path
  end
  def check
    user = User.find_by_login(params[:user][:login])
    if user && user.password == params[:user][:password]
      login(user.id)
      redirect_to user_path(current_user)
    else
      flash[:login_error] = "Wrong login or password"
      render 'sign_up'
    end
  end

  def check_login
    if current_user == nil
      redirect_to sign_up_path
    end
  end

  def check_no_login
    if current_user != nil
      redirect_to user_path(current_user)
    end
  end

  def admin?
    if current_user == nil
      redirect_to sign_up_path
    elsif User.find(current_user).user_role.status != "admin"
      redirect_to user_path(current_user)
    end
  end

  def init_user
    if current_user
      @user = User.find(current_user)
    end

  end






end
