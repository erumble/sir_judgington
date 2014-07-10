require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryGirl.create :category }

  subject { category }

  it { should respond_to :name }
  it { should respond_to :active? }
  it { should respond_to :entries}

  describe :name do
    subject { category.name }

    it { should be_a String }
    it { should eql 'Anime' }
  end

  describe :active? do
    subject { category.active? }

    it { should eql true }
  end

  describe :entries do
    subject { category.entries }

    it { should be_a ActiveRecord::Associations::CollectionProxy }
  end
end
