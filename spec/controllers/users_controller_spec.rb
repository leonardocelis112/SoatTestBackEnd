require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:all) do
    Rails.application.load_tasks
    Rake::Task['db:seed'].invoke
  end
end
