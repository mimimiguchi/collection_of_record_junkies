collection = Collection.new(
  music_id: 13,
  title: "Lost sessions",
  artist: "Pete Rpck",
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
collection.image.attach(io: File.open(Rails.root.join('app/assets/images/Pete rock.jpg')), filename: 'Pete rock.jpg')
collection.save!

