require 'rails_helper'

RSpec.describe Contestant, type: :model do
  before(:each) { @contestant = FactoryGirl.create :contestant }

  subject { @contestant }

  it { should respond_to :first_name }
  it '#first_name should be a string' do
    expect(@contestant.first_name).to eql 'John'
  end

  it { should respond_to :last_name }
  it '#last_name should be a string' do
    expect(@contestant.last_name).to eql 'Smith'
  end

  it { should respond_to :email }
  it '#email should be a string' do
    expect(@contestant.email).to eql 'john.smith@example.com'
  end

  it { should respond_to :costumes }
  it '#costumes should return a CollectionProxy' do
    expect(@contestant.costumes).to be_a ActiveRecord::Associations::CollectionProxy
  end
end
