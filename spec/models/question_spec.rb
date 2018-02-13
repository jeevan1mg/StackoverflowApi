require 'rails_helper'

RSpec.describe Question, type: :model do

  let(:question) {FactoryBot.build(:question)}

  it "has a valid factory" do
    expect(question).to be_valid
  end
end

describe Question do
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_length_of(:title) }
  it { is_expected.to validate_length_of(:text) }
end