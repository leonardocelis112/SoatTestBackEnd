require 'rails_helper'

RSpec.describe SoatInsurancesController, type: :controller do
  before(:all) do
    Rails.application.load_tasks
    Rake::Task['db:seed'].invoke
    @params = {
      user_id: 1,
      vehicle_class_id: 1,
      vehicle_subtype_id: 1,
      registration_plate: 'VHS-256',
      age: 9,
      number_of_passengers: 2,
      cilinder: 125,
      tons: 20
    }
  end
  it('Should create a soat insurance when post to create method') do
    post :create, params: @params
    expect(response).to have_http_status(201)
    expect(response.content_type).to eq('application/json')
    expect(response.body).to include('id')
  end
  it('Should list all created soat insurances when ge to index method') do
    post :create, params: @params
    get :index, params: { user_id: 1 }
    expect(response).to have_http_status(200)
    expect(response.content_type).to eq('application/json')
    expect(response.body.length).to be > 1
  end
end
