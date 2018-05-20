# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BandsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Band. As you add validations to Band, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    FactoryBot.attributes_for(:band)
  end

  let(:invalid_attributes) do
    FactoryBot.attributes_for(:band, name: nil)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BandsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      band = Band.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      band = Band.create! valid_attributes
      get :show, params: { id: band.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Band' do
        expect do
          post :create, params: { band: valid_attributes }, session: valid_session
        end.to change(Band, :count).by(1)
      end

      it 'renders a JSON response with the new band' do
        post :create, params: { band: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(band_url(Band.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new band' do
        post :create, params: { band: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        FactoryBot.attributes_for(:band)
      end

      it 'updates the requested band' do
        band = Band.create! valid_attributes
        put :update, params: { id: band.to_param, band: new_attributes }, session: valid_session
        band.reload
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
        expect(band.name).to eq(new_attributes[:name])
      end

      it 'renders a JSON response with the band' do
        band = Band.create! valid_attributes

        put :update, params: { id: band.to_param, band: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the band' do
        band = Band.create! valid_attributes

        put :update, params: { id: band.to_param, band: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested band' do
      band = Band.create! valid_attributes
      expect do
        delete :destroy, params: { id: band.to_param }, session: valid_session
      end.to change(Band, :count).by(-1)
    end
  end
end
