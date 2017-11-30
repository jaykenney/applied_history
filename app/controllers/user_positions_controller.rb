class UserPositionsController < ApplicationController

  def index
    render locals: { positions: user.positions.by_status.by_employer }
  end

  private

  def user
    @user ||= User.find params.require(:user_id)
  end
end
