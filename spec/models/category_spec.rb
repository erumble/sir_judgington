require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryGirl.create :category }

  subject { category }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :active? }
  it { is_expected.to respond_to :entries}

  describe :name do
    subject { category.name }

    it { is_expected.to be_a String }
    it { is_expected.to eql 'Anime' }
  end

  describe :active? do
    subject { category.active? }

    it { is_expected.to eql true }
  end

  describe :entries do
    subject { category.entries }

    it { is_expected.to be_a ActiveRecord::Associations::CollectionProxy }
  end
end
