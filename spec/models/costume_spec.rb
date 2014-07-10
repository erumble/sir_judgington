require 'rails_helper'

RSpec.describe Costume, type: :model do
  let(:costume) { FactoryGirl.create :costume }

  subject { costume }

  it { is_expected.to respond_to :character_name }
  it { is_expected.to respond_to :property }
  it { is_expected.to respond_to :owner }
  it { is_expected.to respond_to :creators}

  describe :character_name do
    subject { costume.character_name }

    it { is_expected.to be_a String }
    it { is_expected.to eql 'Tyrol Ericson' }
  end

  describe :property do
    subject { costume.property }

    it { is_expected.to be_a String }
    it { is_expected.to eql 'I made it up' }
  end

  describe :owner do
    subject { costume.owner }

    it { is_expected.to be_a Contestant }
  end

  describe :creators do
    subject { costume.creators }

    it { is_expected.to be_a ActiveRecord::Associations::CollectionProxy }
  end
end
