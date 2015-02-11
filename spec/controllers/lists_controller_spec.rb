require 'rails_helper'

RSpec.describe ListsController do
  describe 'GET show' do
    it 'has a 200 status code' do
      list = List.create!
      get :show, id: list
      expect(response.status).to eq 200
    end

    it 'renders the show template' do
      list = List.create!
      get :show, id: list
      expect(response).to render_template('show')
    end

    it 'assigns @list' do
      list = List.create!
      get :show, id: list
      expect(assigns(:list)).to eq list
    end
  end

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders the show template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns @list' do
      lists = List.all
      get :index
      expect(assigns(:lists)).to eq lists
    end
  end


  describe 'GET new' do

    it 'has a 200 status code' do
      list = List.create!
      get :new, id: list
      expect(response.status).to eq 200
    end

    it 'renders the new template' do
      list = List.create!
      get :new, id: list
      expect(response).to render_template('new')
    end

    it 'assigns @list' do
      list = List.create!
      get :new, id: list
      expect(assigns(:list)).to be_a_new List
    end
  end

  describe 'POST create' do
    let(:tester) {
      {name: "Test"}
    }
    it 'saves a new list' do
      expect {
        post :create, list: tester
        }.to change(List, :count).by 1
    end

    it 'redirects to the lists page' do
      post :create, list: tester
      expect(response).to redirect_to('/lists')
    end

    it 'assigns @list' do
      post :create, list: tester
      expect(assigns(:list)).to be_a List
    end
  end




end
