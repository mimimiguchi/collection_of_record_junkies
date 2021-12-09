class CollectionsController < ApplicationController
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


  private

  def collection_params
    params.require(:collection).permit(:image, :music_id, :title, :artist, :year, :description, :size_id, :rpm_id, :status_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
  
end
