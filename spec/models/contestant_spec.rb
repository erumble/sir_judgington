require 'rails_helper'

RSpec.describe Contestant, type: :model do
  let(:contestant) { FactoryGirl.create :contestant }

  subject { contestant }

  it { is_expected.to respond_to :first_name }
  it { is_expected.to respond_to :last_name }
  it { is_expected.to respond_to :email }
  it { is_expected.to respond_to :owned_costumes }
  it { is_expected.to respond_to :created_costumes }
  it { is_expected.to respond_to :entries }

  describe :first_name do
    subject { contestant.first_name }

    it { is_expected.to be_a String }
    it { is_expected.to eql 'John' }
  end

  describe :last_name do
    subject { contestant.last_name }

    it { is_expected.to be_a String }
    it { is_expected.to eql 'Smith' }
  end

  describe :email do
    subject { contestant.email }

    it { is_expected.to be_a String }
    it { is_expected.to eql 'john.smith@example.com' }
  end

  describe :owned_costumes do
    subject { contestant.owned_costumes }

    it { is_expected.to be_a ActiveRecord::Associations::CollectionProxy }
  end


  describe :created_costumes do
    subject { contestant.created_costumes }

    it { is_expected.to be_a ActiveRecord::Associations::CollectionProxy }
  end


  describe :entries do
    subject { contestant.entries }

    it { is_expected.to be_a ActiveRecord::Associations::CollectionProxy }
  end
end
