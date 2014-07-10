require 'rails_helper'

RSpec.describe Costume, type: :model do
  let(:costume) { FactoryGirl.create :costume }

  subject { costume }

  it { should respond_to :character_name }
  it { should respond_to :property }
  it { should respond_to :owner }
  it { should respond_to :creators}

  describe :character_name do
    subject { costume.character_name }

    it { should be_a String }
    it { should eql 'Tyrol Ericson' }
  end

  describe :property do
    subject { costume.property }

    it { should be_a String }
    it { should eql 'I made it up' }
  end

  describe :owner do
    subject { costume.owner }

    it { should be_a Contestant }
  end

  describe :creators do
    subject { costume.creators }

    it { should be_a ActiveRecord::Associations::CollectionProxy }
  end
end
