require 'rails_helper'

RSpec.describe Cosplay, :type => :model do
  let(:cosplay) { FactoryGirl.create :cosplay }

  subject { cosplay }

  it { is_expected.to respond_to :person }
  it { is_expected.to respond_to :character }
  it { is_expected.to respond_to :entry }

  describe :person do
    subject { cosplay.person }

    it { is_expected.to be_a Person }
  end

  describe :character do
    subject { cosplay.character }

    it { is_expected.to be_a Character }
  end

  describe :entry do
    subject { cosplay.entry }

    it { is_expected.to be_a Entry }
  end
end
