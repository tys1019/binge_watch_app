require 'rails_helper'

RSpec.describe StatusesController do
  before(:all) do
    @list = List.create!()
  end

  describe 'POST create' do
    it 'creates new episode-list relationships' do
      expect {
        post :create, article: valid_attributes
      }.to change(Article, :count).by 1
    end

    it 'assigns @article' do
      post :create, article: valid_attributes
      expect(assigns(:article)).to be_an Article
      expect(assigns(:article)).to be_persisted
    end

    it 'redirects to the created article' do
      post :create, article: valid_attributes
      expect(response).to redirect_to(Article.last)
    end
  end
end
