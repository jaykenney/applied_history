class SessionsController < ApplicationController

  def new;
    flash.now.alert = warden.message if warden.message.present?
    render layout: false
  end

  def create
    if user
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = warden.message
      render action: :new, layout: false
    end
  end

  def destroy
    warden.logout
    redirect_to root_url, notice: "Logged out!"
  end

  private

  def user
    @user ||= warden.authenticate
  end

  def warden
    request.env['warden']
  end
end
