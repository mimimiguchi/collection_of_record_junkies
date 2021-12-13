class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @collections = @user.collections
    @count_now = Collection.where(user_id: @user.id, status_id: 2).count
    @count_sell = Collection.where(user_id: @user.id, status_id: 3).count
    @count_total = Collection.where(user_id: @user.id).count
  end

  def search
    @collections = Collection.search(params[:keyword])
  end

end
