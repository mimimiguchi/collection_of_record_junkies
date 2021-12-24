class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :collection
  has_one :address, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
