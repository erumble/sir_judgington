require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) { @category = FactoryGirl.create :category }

  subject { @category }

  it { should respond_to :name }
  it '#name should be a string' do
    expect(@category.name).to eql 'Anime'
  end

  it { should respond_to :active? }
  it '#active? should be a boolean' do
    expect(@category.active?).to eql true
  end

  it { should respond_to :entries}
  it '#creators should return a CollectionProxy' do
    expect(@category.entries).to be_a ActiveRecord::Associations::CollectionProxy
  end
end
