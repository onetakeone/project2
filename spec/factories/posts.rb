FactoryGirl.define do 
  factory :post do
    title "Title"
    body "Text"
    user
  end

  factory :user do
    username 'suer'
    email 'suer@suer'
    password 'suersuer'
  end

end