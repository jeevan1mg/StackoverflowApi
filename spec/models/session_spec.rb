require 'rails_helper'

RSpec.describe Session, type: :model do

  let(:session) {FactoryBot.build(:session)}
  let(:user)    {FactoryBot.build(:user)}


  it 'has a valid factory' do
    expect(session).to be_valid
  end

  describe '#generate_authentication_token' do
    before :each do
      session.user = user
    end
    it 'should generate a unique auth token' do
      expect(session.auth_token).to be_nil
      session.send(:generate_authentication_token)
      expect(session.auth_token).not_to be_nil
    end
  end

  describe '#set_validity' do
    before :each do
      session.user = user
    end
    it 'should set validity' do
      expect(session.valid_till).to be_nil
      session.send(:set_validity)
      expect(session.valid_till).not_to be_nil
    end
  end

  describe '#expire' do
    it 'should set expired at and status to expired' do
      expect(session.expired_at).to be_nil
      expect(session.expired?).to eq false
      session.send(:expire)
      expect(session.expired_at).not_to be_nil
      expect(session.expired?).to eq true
    end
  end

  it 'should do generate auth token and set validity' do
    expect(session).to receive(:generate_authentication_token)
    expect(session).to receive(:set_validity)
    session.save!
  end

end