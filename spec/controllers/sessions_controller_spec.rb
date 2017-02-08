require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST create session' do
    before(:each) do
      @user = build(:user)
      @user.password = "123"
      @user.save
    end

    it 'Should log in an user' do
      post :create, params: { email: @user.email, password: '123' }
      expect(response).to be_success
      expect(response).to have_http_status(201)
      expect(response.content_type).to eq('application/json')
      expect(response.body).to include('first_name')
    end

    it 'Should reject an user without email' do
      post :create, params: { password: '123' }
      expect(response).to have_http_status(404)
      expect(response.body).to include('message')
    end

    it 'Should reject an user without password' do
      post :create, params: { email: @user.email }
      expect(response).to have_http_status(404)
      expect(response.body).to include('message')
    end

    it 'Should reject an user with wrong password' do
      post :create, params: { email: @user.email, password: 'wrong' }
      expect(response).to have_http_status(404)
      expect(response.body).to include('message')
    end
  end
end
