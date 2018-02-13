FactoryBot.define do
  factory :question do
    association :user,     factory: [:user]
    title    'bdcbjdcbdj'
    text     'bhwebfwebvwebvwhbv whebcwibfcwebfc wehcweivcwehbvc'
  end
end