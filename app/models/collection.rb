class Collection < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :music_id, numericality: { other_than: 1 , message: "を選択してください。" }
    validates :title
    validates :artist
    validates :size_id, numericality: { other_than: 1 , message: "を選択してください。" }
    validates :rpm_id, numericality: { other_than: 1 , message: "を選択してください。" }
    validates :status_id, numericality: { other_than: 1 , message: "を選択してください。" }
  end

  with_options presence: true, if: :sale? do
    validates :delivery_charge_id, numericality: { other_than: 1 , message: "を選択してください。" }
    validates :prefecture_id, numericality: { other_than: 1 , message: "を選択してください。" }
    validates :delivery_day_id, numericality: { other_than: 1 , message: "を選択してください。" }
    validates :price, numericality: { only_integer: true, message: "を整数で入力してください。" }
  end


  def sale?
    status_id == 3
  end

end
