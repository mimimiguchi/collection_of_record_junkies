class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :collections
  has_many :wants, dependent: :destroy

  
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :nickname, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は有効でありません。全角文字で入力してください' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'は有効でありません。全角カタカナで入力してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :birthday, presence: true

  def self.search(search)
    if search != ""
      Collection.where('title LIKE(?) OR artist LIKE(?)', "%#{search}%", "%#{search}%")
    else
      Collection.all
    end
  end

  def already_wanted?(collection)
    self.wants.exists?(collection_id: collection.id)
  end
  
end