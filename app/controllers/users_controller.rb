class UsersController < ApplicationController
  require 'mandrill'

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.save
      # logs user in automatically upon signup
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
    # @locate = request.remote_ip
 
   
  end

  def edit
    @user = User.find params[:id]

    @ip_address = request.remote_ip
    @list = Geocoder.search @ip_address
    @city = @list.first.city

    @user.update(:lat => @list[0].latitude, :long => @list[0].longitude)
  end

  def update
    user = User.find params[:id]
    user.update user_params
    redirect_to user_path
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to users_path
  end

  def send_email

    # User.check_weather(   )

  end



  # def notification(message)
#   @user = User.find params[:id]

#   m = Mandrill::API.new
#     message = {
#     :subject=> "Weather Alert!",
#     :from_name=> "Diabetease",
#     :text=>"Hi #{@user.username}, " message,
#     :to=>[
#     {
#     :email=> 'xandero999@gmail.com',       #@user.email
#     :name=> @user.username
#     }
#     ],
#     :from_email=>"alerts@diabetease.com"
#     }
#     sending = m.messages.send message
# end

  private
  def user_params
    params.require(:user).permit(:username, :email, :dob, :gender, :weight, :height, :basal_insulin, :bolus_insulin, :diabetes_type, :password, :password_confirmation)
  end
end
