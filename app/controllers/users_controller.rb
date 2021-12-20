class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:wants]
  before_action :set_user, only: [:show, :search, :wants, :post, :sell, :past]
  before_action :set_nickname, only: [:show, :search, :wants, :post, :sell, :past]
  before_action :count, only: [:show, :post, :sell, :past]
  before_action :move_to_want, only: [:wants]
  before_action :move_to_home, only: [:post, :sell, :past]

  def show
    @collections = @user.collections.order("created_at DESC")
  end

  def search
    @collections = Collection.where(user_id: @user.id).order(created_at: "DESC").search(params[:keyword])
  end

  def wants
    wants = Want.where(user_id: @user.id).pluck(:collection_id)
    @collections = Collection.order(created_at: "DESC").find(wants)
  end

  def post
    posts = Collection.where(user_id: @user.id, status_id: 2).pluck(:id)
    @collections = Collection.order(created_at: "DESC").find(posts)
  end

  def sell
    pasts = Collection.where(user_id: @user.id).joins(:purchase).pluck(:collection_id)
    sells = Collection.where(user_id: @user.id, status_id: 3).where.not(id: pasts).pluck(:id)
    @collections = Collection.order(created_at: "DESC").find(sells)
  end

  def past
    pasts = Collection.where(user_id: @user.id).joins(:purchase).pluck(:collection_id)
    @collections = Collection.order(created_at: "DESC").find(pasts)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_nickname
    @nickname = @user.nickname
  end

  def move_to_want
    unless user_signed_in? && current_user.id == @user.id
      redirect_to wants_user_path(current_user.id)
    end
  end

  def move_to_home
    unless user_signed_in? && current_user.id == @user.id
      redirect_to root_path
    end
  end

  def count
    @count_now = Collection.where(user_id: @user.id, status_id: 2).count
    @count_sell = Collection.where(user_id: @user.id, status_id: 3).count
    @count_total = Collection.where(user_id: @user.id).count
    @count_sold_out = Collection.where(user_id: @user.id).joins(:purchase).pluck(:collection_id).count
  end

end
