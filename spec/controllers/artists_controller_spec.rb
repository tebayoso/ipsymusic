# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Artist. As you add validations to Artist, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    FactoryBot.attributes_for(:artist)
  end

  let(:invalid_attributes) do
    FactoryBot.attributes_for(:artist, name: nil)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ArtistsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      artist = Artist.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      artist = Artist.create! valid_attributes
      get :show, params: { id: artist.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Artist' do
        expect do
          post :create, params: { artist: valid_attributes }, session: valid_session
        end.to change(Artist, :count).by(1)
      end

      it 'renders a JSON response with the new artist' do
        post :create, params: { artist: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(artist_url(Artist.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new artist' do
        post :create, params: { artist: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        FactoryBot.attributes_for(:artist)
      end

      it 'updates the requested artist' do
        artist = Artist.create! valid_attributes
        put :update, params: { id: artist.to_param, artist: new_attributes }, session: valid_session
        artist.reload
        expect(response.content_type).to eq('application/json')
      end

      it 'renders a JSON response with the artist' do
        artist = Artist.create! valid_attributes

        put :update, params: { id: artist.to_param, artist: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the artist' do
        artist = Artist.create! valid_attributes

        put :update, params: { id: artist.to_param, artist: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested artist' do
      artist = Artist.create! valid_attributes
      expect do
        delete :destroy, params: { id: artist.to_param }, session: valid_session
      end.to change(Artist, :count).by(-1)
    end
  end
end
