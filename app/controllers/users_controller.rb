class UsersController < ApplicationController
  before_action :authenticate_user!, onlyt: [:wants]
  before_action :set_user, only: [:show, :search, :wants]
  before_action :set_nickname, only: [:show, :search, :wants]
  before_action :move_to_index, only: [:wants]

  def show
    @collections = @user.collections
    @count_now = Collection.where(user_id: @user.id, status_id: 2).count
    @count_sell = Collection.where(user_id: @user.id, status_id: 3).count
    @count_total = Collection.where(user_id: @user.id).count
  end

  def search
    @collections = Collection.where(user_id: @user.id).search(params[:keyword])
  end

  def wants
    wants = Want.where(user_id: @user.id).pluck(:collection_id)
    @collections = Collection.find(wants)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_nickname
    @nickname = @user.nickname
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @user.id
      redirect_to wants_user_path(current_user.id)
    end
  end

end
