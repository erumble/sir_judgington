require 'rails_helper'

RSpec.describe Person, :type => :model do
  let(:person) { FactoryGirl.create :person }

  subject { person }

  it { is_expected.to respond_to :first_name }
  it { is_expected.to respond_to :last_name }
  it { is_expected.to respond_to :phonetic_spelling }
  it { is_expected.to respond_to :email }
  # it { is_expected.to respond_to :owned_costumes }
  # it { is_expected.to respond_to :created_costumes }
  it { is_expected.to respond_to :cosplays }
  it { is_expected.to respond_to :characters }
  it { is_expected.to respond_to :entries }

  describe :first_name do
    subject { person.first_name }

    it { is_expected.to be_a String }
    it { is_expected.to eql 'John' }
  end

  describe :last_name do
    subject { person.last_name }

    it { is_expected.to be_a String }
    it { is_expected.to eql 'Smith' }
  end

  describe :phonetic_spelling do
    subject { person.phonetic_spelling }

    it { is_expected.to be_a String }
    it { is_expected.to eql 'John Smith'}
  end

  describe :email do
    subject { person.email }

    it { is_expected.to be_a String }
    it { is_expected.to eql 'john.smith@example.com' }
  end

  # describe :owned_costumes do
  #   subject { person.owned_costumes }
  #
  #   it { is_expected.to be_a ActiveRecord::Associations::CollectionProxy }
  # end

  # describe :created_costumes do
  #   subject { person.created_costumes }
  #
  #   it { is_expected.to be_a ActiveRecord::Associations::CollectionProxy }
  # end

  describe :entries do
    subject { person.entries }

    it { is_expected.to be_a ActiveRecord::Associations::CollectionProxy }
  end
end
