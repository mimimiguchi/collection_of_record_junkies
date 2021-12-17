class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :collection_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "を例のように入力してください (例 123-4567)"}
    validates :prefecture_id, numericality: {other_than: 1 , message: "を選択してください"}
    validates :city
    validates :block
    validates :phone_number
    validates :user_id
    validates :collection_id
  end
  validates :phone_number, length: { minimum: 10 , message: 'を10桁以上で入力してください' }
  validates :phone_number, length: { maximum: 11 , message: 'を11桁以下で入力してください' }
  validates :phone_number, numericality: { only_integer: true , message: 'を半角数字で入力してください' }

  def save
    purchase = Purchase.create(user_id: user_id, collection_id: collection_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end