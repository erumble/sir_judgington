require 'rails_helper'

RSpec.describe Contest, :type => :model do
  # Create some categories so they can be added to the contest
  before :all do
    3.times do
      FactoryGirl.create :category, common: true
      FactoryGirl.create :category, common: false
      
      FactoryGirl.create :judging_time, common: true
      FactoryGirl.create :judging_time, common: false
    end
  end

  let(:contest) { FactoryGirl.create :contest }

  subject { contest }

  it { is_expected.to respond_to :date }
  it { is_expected.to respond_to :entries }
  it { is_expected.to respond_to :categories }
  it { is_expected.to respond_to :judging_times }
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
    it { is_expected.to include Category.where(common: true).take }

    it 'should have all common categories' do
      expect(contest.categories.count).to eql Category.where(common: true).count
    end
  end

  describe :judging_times do
    subject { contest.judging_times }

    it { is_expected.to be_a ActiveRecord::Associations::CollectionProxy }
    it { is_expected.to include JudgingTime.where(common: true).take }

    it 'should have all common judging times' do
      expect(contest.judging_times.count).to eql JudgingTime.where(common: true).count
    end
  end

  describe :has_category? do
    subject { contest.has_category? category }

    context 'when category is in contest.categories' do
      let(:category) { contest.categories.take }

      it { is_expected.to eql true }
    end

    context 'when category is not in contest.categories' do
      let(:category) { Category.where(common: false).take }

      it { is_expected.to eql false }
    end
  end

end
