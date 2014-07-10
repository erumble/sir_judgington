require 'rails_helper'

RSpec.describe Contestant, type: :model do
  before(:each) { @contestant = FactoryGirl.create :contestant }

  subject { @contestant }

  it { should respond_to :first_name }
  it { should respond_to :last_name }
  it { should respond_to :email }
  it { should respond_to :owned_costumes }
  it { should respond_to :created_costumes }
  it { should respond_to :entries }

  describe :first_name do
    subject { @contestant.first_name }

    it { should be_a String }
    it { should eql 'John' }
  end

  describe :last_name do
    subject { @contestant.last_name }

    it { should be_a String }
    it { should eql 'Smith' }
  end

  describe :email do
    subject { @contestant.email }

    it { should be_a String }
    it { should eql 'john.smith@example.com' }
  end

  describe :owned_costumes do
    subject { @contestant.owned_costumes }

    it { should be_a ActiveRecord::Associations::CollectionProxy }
  end


  describe :created_costumes do
    subject { @contestant.created_costumes }

    it { should be_a ActiveRecord::Associations::CollectionProxy }
  end


  describe :entries do
    subject { @contestant.entries }

    it { should be_a ActiveRecord::Associations::CollectionProxy }
  end
end
