class PagesController < ApplicationController
  def landing
  end

  def about
  end

  def testing
    @user = User.find @current_user.id
    @ip_address = request.remote_ip
    @list = Geocoder.search @ip_address
    @city = @list.first.city
    @user.update(:lat => @list[0].latitude, :long => @list[0].longitude)
  end

  def calc
  end
end
