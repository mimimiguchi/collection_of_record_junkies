class WantsController < ApplicationController
  before_action :set_collection

  def create
    @want = Want.create(user_id: current_user.id, collection_id: @collection.id)
    @want.save
  end

  def destroy
    @want = Want.find_by(user_id: current_user.id, collection_id: @collection.id)
    @want.destroy
  end

  private
    
    def set_collection
      @collection = Collection.find(params[:collection_id])
    end

end
