require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:user1)    {FactoryBot.create(:user)}
  let(:user2)    {FactoryBot.create(:user)}
  let(:question) {FactoryBot.create(:question, user: user1)}
  let(:answer)   {FactoryBot.create(:answer, question: question, user: user1)}
  let(:comment)  {FactoryBot.create(:comment, commentable: answer, user: user2)}

  it "has a valid factory" do
    expect(answer).to be_valid
  end


  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:text) }
  it { is_expected.to validate_presence_of(:question) }
  it { is_expected.to validate_length_of(:text)}
end