FactoryGirl.define do
  sequence :email do |n|
    "sample#{n}@example.com"
  end

  sequence :id do |n|
    n
  end

  sequence :title do |n|
    "Title number#{n}"
  end

  sequence :content do |n|
    "Very simple todo with number #{n}"
  end

  factory :user do
    id { generate(:id)}
    email { generate(:email) }
    password "qwerty1234"
    updated_at "2015-03-31 16:18:11"
    created_at "2015-03-30 15:03:42"
    last_sign_in_ip "127.0.0.1"
    current_sign_in_ip "127.0.0.1"
    last_sign_in_at "2015-03-30 22:04:49"
    current_sign_in_at "2015-03-31 16:18:11"
    sign_in_count 39
  end

  factory :list do
    id { generate(:id) }
    title { generate(:title)}
    description { SecureRandom.hex(50) }
    created_at { Time.now }
    updated_at { Time.now }
    user
  end

  factory :todo do
    content { generate(:content) }
    list
  end
end