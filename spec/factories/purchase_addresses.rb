FactoryBot.define do
  factory :purchase_address do
    postcode { '279-0031' }
    prefecture_id { 13 }
    city { '浦安市' }
    block { '舞浜1-1' }
    building { '夢の国101' }
    phone_number { '0453305211' }
    token { "tok_abcdefghijk00000000000000000" }
  end
end
