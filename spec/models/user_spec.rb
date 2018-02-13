require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {FactoryBot.build(:user)}

  it "has a valid factory" do
    expect(user).to be_valid
  end

  describe "#encryt_password" do
    before :each do
      user.salt = nil
      user.encrypted_password = nil
    end
    context 'if password is present' do
      before :each do
        user.password = 'somepassword'
      end
      it 'should set encrypted password and salt' do
        expect(user.encrypted_password).to be_nil
        expect(user.salt).to be_nil
        user.send(:encrypt_password)
        expect(user.encrypted_password).not_to be_nil
        expect(user.salt).not_to be_nil
      end
    end
    context 'if password is not present' do
      before :each do
        user.password = nil
      end
      it 'should not set encrypted password and salt' do
        expect(user.encrypted_password).to be_nil
        expect(user.salt).to be_nil
        user.send(:encrypt_password)
        expect(user.encrypted_password).to be_nil
        expect(user.salt).to be_nil
      end
    end
  end

  describe "#delete_password" do
    before :each do
      user.salt = nil
      user.encrypted_password = nil
    end
    context 'if password is present' do
      before :each do
        user.password = 'somepassword'
      end
      it 'should set password nil' do
        expect(user.password).not_to be_nil
        user.send(:delete_password)
        expect(user.password).to be_nil
      end
    end
  end
end

describe User do
  it { is_expected.to validate_presence_of(:user_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_length_of(:password)}
end