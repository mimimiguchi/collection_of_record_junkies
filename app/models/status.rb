class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: 'コレクション'},
    { id: 3, name: '出品'}
  ]

  include ActiveHash::Associations
  has_many :collections

end