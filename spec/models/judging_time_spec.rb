require 'rails_helper'

RSpec.describe JudgingTime, :type => :model do
  let(:judging_time) { FactoryGirl.create :judging_time, time: '12:00' }

  subject { judging_time }

  it { is_expected.to respond_to :time }
  it { is_expected.to respond_to :common? }
  it { is_expected.to respond_to :entries }
  it { is_expected.to respond_to :contests }

  describe :time do
    subject { judging_time.time }

    it { is_expected.to be_a String }
    it { is_expected.to eql '12:00' }
  end

  describe :common? do
    subject { judging_time.common? }

    it { is_expected.to eql false }
  end

  describe :entries do
    subject { judging_time.entries }

    it { is_expected.to be_a ActiveRecord::Associations::CollectionProxy }
  end

  describe :contests do
    subject { judging_time.contests }

    it { is_expected.to be_a ActiveRecord::Associations::CollectionProxy }
  end
end
