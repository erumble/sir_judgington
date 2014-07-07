require 'rails_helper'

RSpec.describe Costume, type: :model do
  before(:each) { @costume = FactoryGirl.create :costume }

  subject { @costume }

  it { should respond_to :character_name }
  it '#character_name should be a string' do
    expect(@costume.character_name).to eql 'Tyrol Ericson'
  end

  it { should respond_to :property }
  it '#property should be a string' do
    expect(@costume.property).to eql 'I made it up'
  end

  it { should respond_to :owner }
  it '#owner should return a contestant' do
    expect(@costume.owner).to be_a Contestant
  end

  it { should respond_to :creators}
  it '#creators should return a CollectionProxy' do
    expect(@costume.creators).to be_a ActiveRecord::Associations::CollectionProxy
  end
end
