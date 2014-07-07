require 'rails_helper'

RSpec.describe Entry, type: :model do
  before(:each) { @entry = FactoryGirl.create :entry }

  subject { @entry }

  it { should respond_to :contest_date }
  it '#contest_date should be a date' do
    expect(@entry.contest_date).to eql Date.parse 'Thu, 03 Jul 2014'
  end

  it { should respond_to :skill_level }
  it '#skill_level should be an enum' do
    expect(@entry.skill_level).to eql 'master'
  end

  it { should respond_to :hot_or_bulky? }
  it '#hot_or_bulky? should be a boolean' do
    expect(@entry.hot_or_bulky?).to eql false
  end

  it { should respond_to :group_name }
  it '#group_name should be a string' do
    expect(@entry.group_name).to eql 'Trouble Makers'
  end

  it { should respond_to :categories}
  it '#creators should return a CollectionProxy' do
    expect(@entry.categories).to be_a ActiveRecord::Associations::CollectionProxy
  end

  it { should respond_to :contestants}
  it '#creators should return a CollectionProxy' do
    expect(@entry.contestants).to be_a ActiveRecord::Associations::CollectionProxy
  end
end
