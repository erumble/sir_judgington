require 'rails_helper'

RSpec.describe Entry, type: :model do
  before(:each) { @entry = FactoryGirl.create :entry }

  subject { @entry }

  it { should respond_to :contest_date }
  it { should respond_to :skill_level }
  it { should respond_to :hot_or_bulky? }
  it { should respond_to :group_name }
  it { should respond_to :categories}
  it { should respond_to :contestants}

  describe :contest_date do
    subject { @entry.contest_date }

    it { should be_a Date }
    it { should eql Date.parse 'Thu, 03 Jul 2014' }
  end

  describe :skill_level do
    subject { @entry.skill_level }

    it { should be_a String }
    it { should eql 'master' }
  end


  describe :hot_or_bulky? do
    subject { @entry.hot_or_bulky? }

    it { should eql false }
  end


  describe :group_name do
    subject { @entry.group_name }

    it { should be_a String }
    it { should eql 'Trouble Makers' }
  end


  describe :categories do
    subject { @entry.categories }

    it { should be_a ActiveRecord::Associations::CollectionProxy }
  end

  describe :contestants do
    subject { @entry.contestants }

    it { should be_a ActiveRecord::Associations::CollectionProxy }
  end
end
