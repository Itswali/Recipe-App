require 'rails_helper'
require 'rspec/rails'

RSpec.describe Food, type: :model do
  subject do
    Food.new(name: 'apple', measuring_unit: 'kg', price: 5, quantity: 10, user_id: 1)
  end
  before { subject.save }

  it 'name should be present' do
    subject.name = 'apple'
    expect(subject).to_not be_valid
  end

  it 'measuring_unit should be present' do
    subject.measuring_unit = nil
    expect(subject).to_not be_valid
  end

  it 'price should be present' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'user id should be present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end
