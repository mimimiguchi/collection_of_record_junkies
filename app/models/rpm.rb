class Rpm < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: '33rpm'},
    { id: 3, name: '45rpm'}
  ]

  include ActiveHash::Associations
  has_many :collections
  
end