require 'rails_helper'
require 'rake'

RSpec.describe SoatInsurance, type: :model do
  before(:all) do
    Rails.application.load_tasks
    Rake::Task['db:seed'].invoke
  end

  it('Should create succesfully a soat insurance') do
    insurance = build(:soat_insurance)
    expect(insurance.save).to be(true)
  end

  it('Should create a soat insurance dates correctly if no actives') do
    insurance = build(:soat_insurance)
    insurance.save
    expect(insurance.acquired_date.to_date).to eq(Time.zone.now.to_date)
    expect(insurance.expiration_date.to_date).to eq(insurance.acquired_date.to_date + 1.year)
  end

  it('Should crete a soat insurance with acquired date 1 day after the active one') do
    insurance1 = build(:soat_insurance)
    insurance1.save
    insurance2 = build(:soat_insurance)
    insurance2.save
    expect(insurance2.acquired_date.to_date).to eq(insurance1.expiration_date.to_date + 1.day)
  end

end
