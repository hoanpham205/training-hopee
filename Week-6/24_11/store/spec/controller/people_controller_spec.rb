# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it 'assigns a new Contact to @contact'
    it 'renders the :new template'
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          person: FactoryBot.attributes_for(:person)
        }
      end
      

      it 'creates a new person' do
        expect do
          post :create, params: valid_params
        end.to change(Person, :count).by(1)
      end

      it 'redirects to the created person' do
        post :create, params: valid_params
        expect(response).to redirect_to(person_url(Person.last))
      end

      it 'sets a notice flash message' do
        post :create, params: valid_params
        expect(flash[:notice]).to be_present
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          person: FactoryBot.attributes_for(:person, full_name: '')
        }
      end

      it 'does not create a new person' do
        expect do
          post :create, params: invalid_params
        end.to_not change(Person, :count)
      end

      it 'renders the new template' do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end

      it 'sets an unprocessable entity flash message' do
        post :create, params: invalid_params
        expect(flash[:alert]).to be_present
      end
    end
  end
end
