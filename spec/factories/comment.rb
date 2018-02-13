FactoryBot.define do
  factory :comment do
    user
    text        'dvbsicbskjbvsdjkvbcsdkbvsdkjzbc  dchsdvkhds'

    factory :question_comment do
      association :commentable, factory: [:question]
    end

    factory :answer_comment do
      association :commentable, factory: [:answer]
    end

  end
end