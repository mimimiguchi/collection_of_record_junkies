class UsersController < ApplicationController
  before_action :user_nickname, only: [:show, :search]

  def show
    @collections = @user.collections
    @count_now = Collection.where(user_id: @user.id, status_id: 2).count
    @count_sell = Collection.where(user_id: @user.id, status_id: 3).count
    @count_total = Collection.where(user_id: @user.id).count
  end

  def search
    @collections = Collection.where(user_id: @user.id).search(params[:keyword])
  end

  private

  def user_nickname
    @user = User.find(params[:id])
    @nickname = @user.nickname
  end

end
