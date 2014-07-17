require 'rails_helper'

RSpec.describe Contest, :type => :model do
  let(:contest) { FactoryGirl.create :contest }

  subject { contest }

  it { is_expected.to respond_to :date }
  it { is_expected.to respond_to :entries }
  it { is_expected.to respond_to :categories }
  # it { is_expected.to respond_to :judging_times }
  it { is_expected.to respond_to :has_category? }

  describe :date do
    subject { contest.date }

    it { is_expected.to be_a Date }
    it { is_expected.to eql Date.parse '27-09-2014' }
  end

  describe :entries do
    subject { contest.entries }

    it { is_expected.to be_a ActiveRecord::Associations::CollectionProxy }
  end

  describe :categories do
    subject { contest.categories }

    it { is_expected.to be_a ActiveRecord::Associations::CollectionProxy }
  end

  # describe :judging_times do
  #   subject { contest.judging_times }
  #
  #   it { is_expected.to be_a ActiveRecord::Associations::CollectionProxy }
  # end

  describe :has_category? do
    let(:contest_with_categories) { FactoryGirl.create :contest_with_categories }
    subject { contest_with_categories.has_category? category }

    context 'when category is in contest.categories' do
      let(:category) { contest_with_categories.categories.first }

      it { is_expected.to eql true }
    end

    context 'when category is not in contest.categories' do
      let(:category) { FactoryGirl.create(:category).name }

      it { is_expected.to eql false }
    end
  end

end
