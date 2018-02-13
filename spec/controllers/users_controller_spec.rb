require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  let(:user)  {FactoryBot.create(:user)}

  describe "POST #create" do
    context "with valid attributes" do
      it "create new user" do
        post :create, params: {user: FactoryBot.attributes_for(:user)}
        expect(User.count).to eq(1)
      end
    end

    context "without valid attributes" do
      it "create new user" do
        post :create, params: {user: {:user_name=>"abagail_reilly", :email=>"mariam@stehr.co", :password=>"P708jSf", :password_confirmation=>"P708BjSf"}}
        expect(User.count).to eq(0)
      end
    end
  end

  describe 'GET #show' do
    context 'with valid id' do
      it 'returns user with id 1' do
        get :show, params: {id: user.id}
        puts json = JSON.parse(response.body)
        expect(json["user"]["id"]).to eq(user.id)
      end
    end
  end


end