FactoryBot.define do
  factory :collection do
    music_id            {2}
    title               {'Hip Hop is Dead'}
    artist              {'Nas'}
    year                {'0000'}
    description         {'あ'}
    size_id             {2}
    rpm_id              {2}
    association :user

    after(:build) do |collection|
      collection.image.attach(io: File.open('Public/images/nas.jpg'), filename: 'nas.jpg')
    end
  
    factory :collection_post do
      status_id           {2}
      delivery_charge_id  {1}
      prefecture_id       {1}
      delivery_day_id     {1}
      price               {''}
    end

    factory :collection_sell do
      status_id           {3}
      delivery_charge_id  {2}
      prefecture_id       {2}
      delivery_day_id     {2}
      price               {1000}
    end

  end
end
