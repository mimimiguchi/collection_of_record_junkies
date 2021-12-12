class CollectionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_collection, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit]

  def index
    @collections = Collection.order("created_at DESC")
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    if @collection.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @collection.update(collection_params)
      redirect_to collection_path
    else
      render :edit
    end
  end

  def search
    @collections = Collection.search(params[:keyword])
  end


  private

  def collection_params
    params.require(:collection).permit(:image, :music_id, :title, :artist, :year, :description, :size_id, :rpm_id, :status_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_collection
    @collection = Collection.find(params[:id])
  end
  
  def move_to_index
    if current_user.id != @collection.user.id
      redirect_to action: :index
    end
  end
  
end
