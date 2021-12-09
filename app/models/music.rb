class Music < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: 'OLD ROCK'},
    { id: 3, name: 'ROCK/POPS/INDIE'},
    { id: 4, name: 'PROGRESSIVE ROCK'},
    { id: 5, name: 'HARD ROCK/HEVY METAL'},
    { id: 6, name: 'PUNK'},
    { id: 7, name: 'JAZZ'},
    { id: 8, name: 'SOUL/BLUES'},
    { id: 9, name: 'LATIN/BRAZIL/WORLD MUSIC'},
    { id: 10, name: 'REGGAE'},
    { id: 11, name: 'NOISE/ADVANT-GARDE'},
    { id: 12, name: 'CLUB/DANCE'},
    { id: 13, name: 'HIP HOP/日本語RAP'},
    { id: 14, name: 'CLASSIC'},
    { id: 15, name: 'JAPANESE POPS'},
    { id: 16, name: '昭和歌謡'},
    { id: 17, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :collections

end