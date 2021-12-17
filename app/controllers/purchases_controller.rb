class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_collection_id, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_collection
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, collection_id: params[:collection_id], token: params[:token])
  end

  def set_collection_id
    @collection = Collection.find(params[:collection_id])
  end

  def pay_collection
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @collection.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user.id == @collection.user.id || @collection.purchase.present? 
      redirect_to root_path
    end
  end

end
