collection = Collection.new(
  music_id: 13,
  title: "ASTEROID LOVE",
  artist: "L-universe",
  year: "",
  description: "",
  size_id: 3,
  rpm_id: 2,
  status_id: 2,
  delivery_charge_id: 1,
  prefecture_id: 1,
  delivery_day_id: 1,
  price: "",
  user_id: 1
)
collection.image.attach(io: File.open(Rails.root.join('app/assets/images/IMG_2741.jpg')), filename: 'IMG_2741.jpg')
collection.save!

