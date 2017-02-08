require 'rails_helper'
require 'rake'
RSpec.describe VehicleClassesController, type: :controller do
  describe('GET Responses from vehicle classes index') do
    before(:each) do
      Rails.application.load_tasks
      Rake::Task['db:seed'].invoke
    end

    it('Should load the vehicle classes and subtypes') do
      get :index
      expect(JSON.parse(response.body).length).to eq(9)
    end
  end
end
