class Size < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: '7inch'},
    { id: 3, name: '12inch'}
  ]

  include ActiveHash::Associations
  has_many :collections
  
end