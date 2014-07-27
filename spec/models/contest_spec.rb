require 'rails_helper'

RSpec.describe Contest, :type => :model do
  # Create some categories so they can be added to the contest
  before :all do
    [true, false].each do |bool|
      FactoryGirl.create_list :category, 3, common: bool
      FactoryGirl.create_list :judging_time, 3, common: bool
    end
  end

  let(:contest) { FactoryGirl.create :contest }

  subject { contest }

  it { is_expected.to respond_to :date }
  it { is_expected.to respond_to :entries }
  it { is_expected.to respond_to :categories }
  it { is_expected.to respond_to :judging_times }
  it { is_expected.to respond_to :has_category? }
  it { is_expected.to respond_to :available_judging_times }

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

  describe :has_judging_time? do
    subject { contest.has_judging_time? judging_time }

    context 'when judging_time is in contest.judging_times' do
      let(:judging_time) { contest.judging_times.take }

      it { is_expected.to eql true }
    end

    context 'when judging_time is not in contest.judging_times' do
      let(:judging_time) { JudgingTime.where(common: false).take }

      it { is_expected.to eql false }
    end
  end

  describe :available_judging_times do
    let(:c2) { FactoryGirl.create :contest }
    subject { contest.available_judging_times }

    context 'when no judging times are used up' do
      it 'should have the same times as contest.judging_times' do
        expect(contest.available_judging_times).to eql contest.judging_times.to_a
      end
    end

    context 'when a judging time is used up' do
      before :each do
        FactoryGirl.create_list :entry, 5, contest: contest, judging_time: contest.judging_times.first
      end

      it 'should have 1 fewer judging times' do
        expect(contest.available_judging_times.count).to eql (contest.judging_times.count - 1)
      end

      it 'should not interfere with contest_two' do
        expect(contest.available_judging_times.count).not_to eql c2.available_judging_times.count
      end
    end
  end

end
