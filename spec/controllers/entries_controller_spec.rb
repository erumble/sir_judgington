require "rails_helper"

describe EntriesController, type: :controller do
  subject(:index) { get :index, {  } }
  subject(:new) { get :new, {  } }
  subject(:create) { post :create, {  } }

  describe 'index' do
    it { expect(index).to be_success }
  end

  describe 'new' do
    it { expect(new).to be_success }
  end

  describe 'create' do
    it { expect(create).to be_redirect }
  end
end
