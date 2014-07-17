require 'rails_helper'

RSpec.describe CategoryEntry, :type => :model do
  let(:category_entry) { FactoryGirl.build :category_entry }

  subject { category_entry }

  it { is_expected.to respond_to :entry }
  it { is_expected.to respond_to :category }

  describe :category do
    subject { category_entry.category }

    it { is_expected.to be_a Category }
  end

  describe :entry do
    subject { category_entry.entry }

    it { is_expected.to be_a Entry }
  end

  describe :valid? do
    subject { category_entry.valid? }

    context 'when category is not valid' do
      let(:category_entry) { FactoryGirl.build :category_entry }

      it { is_expected.to eql false }
    end

    context 'when category is valid' do
      let(:category_entry) { FactoryGirl.build :valid_category_entry }

      it { is_expected.to eql true }
    end
  end

end
