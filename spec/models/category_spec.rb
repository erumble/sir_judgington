require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryGirl.create(:category, name: 'test_category') }

  subject { category }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :common? }
  it { is_expected.to respond_to :entries}
  it { is_expected.to respond_to :contests }

  describe :name do
    subject { category.name }

    it { is_expected.to be_a String }
    it { is_expected.to eql 'test_category' }
  end

  describe :common? do
    subject { category.common? }

    it { is_expected.to eql false }
  end

  describe :entries do
    subject { category.entries }

    it { is_expected.to be_a ActiveRecord::Associations::CollectionProxy }
  end

  describe :contests do
    subject { category.contests }

    it { is_expected.to be_a ActiveRecord::Associations::CollectionProxy }
  end
end
