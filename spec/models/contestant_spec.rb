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

  it { should respond_to :owned_costumes }
  it '#owned_costumes should return a CollectionProxy' do
    expect(@contestant.owned_costumes).to be_a ActiveRecord::Associations::CollectionProxy
  end

  it { should respond_to :created_costumes }
  it '#created_costumes should return a CollectionProxy' do
    expect(@contestant.created_costumes).to be_a ActiveRecord::Associations::CollectionProxy
  end

  it { should respond_to :entries }
  it '#entries should return a CollectionProxy' do
    expect(@contestant.entries).to be_a ActiveRecord::Associations::CollectionProxy
  end
end
