FactoryBot.define do
  factory :answer do
    association :user,     factory: [:user]
    association :question, factory: [:question]
    text        'dvbsicbskjbvsdjkvbcsdkbvsdkjzbc  dchsdvkhds'
  end
end