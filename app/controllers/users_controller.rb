class UsersController < ApplicationController
  before_action :check_login, only: [ :show, :edit, :update, :destroy, :index]
  before_action :check_no_login, only: [:sign_up, :new, :create]
  #before_action :admin?, only: [:index]
  before_action :self?, only: [:edit, :update, :destroy]


  def index
    if !params[:sort]
      @users = User.all
    elsif params[:sort] == "my_students"
      @users = @self_user.students.uniq
    elsif params[:sort] == "my_teachers"
      @users = @self_user.teachers.uniq
    end


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
      login(@user.id)
      go_to_user
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.update(params[:id],
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
      render 'edit'
    else
      go_to_user
    end
  end

  def destroy
    User.find(params[:id]).delete
    redirect_to sign_out_path
  end

  def show
    @user = User.find(params[:id])
  end








  def sign_up

  end

  def sign_out
    logout
    @self_user = nil
    redirect_to sign_up_path
  end
  def check
    user = User.find_by_login(params[:user][:login])
    if user && user.password == params[:user][:password]
      login(user.id)
      go_to_user
    else
      flash[:login_error] = "Wrong login or password"
      render 'sign_up'
    end
  end

  def self?()
    if current_user != params[:id].to_i
      go_to_user
    end
  end

  def admin_or_self
    if User.find(current_user).user_role.status != "admin" && current_user != params[:id].to_i || check_login
      go_to_user
    end
  end














end
