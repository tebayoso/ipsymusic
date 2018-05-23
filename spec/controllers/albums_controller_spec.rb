# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  let!(:author) { FactoryBot.create(:artist) }

  # This should return the minimal set of attributes required to create a valid
  # Album. As you add validations to Album, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    FactoryBot.attributes_for(:album, author_type: author.class, author_id: author.id)
  end

  let(:valid_attributes_with_songs) do
    artist = FactoryBot.create(:artist)
    songs = FactoryBot.create_list(:song, 10, author: artist)
    FactoryBot.attributes_for(:playlist).merge(song_ids: songs)
  end

  let(:invalid_attributes) do
    FactoryBot.attributes_for(:album, name: nil, author_type: author.class, author_id: author.id)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AlbumsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    after :each do
      Album.searchkick_index.delete
    end

    it 'returns a success response' do
      album = Album.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end

    it 'searches in the database if the params query is present' do
      Album.reindex
      album = Album.create valid_attributes.merge(name: 'XXXXXXXX')
      artist = FactoryBot.create(:artist)
      FactoryBot.create_list(:album, 10, author: artist)
      Album.reindex
      get :index, params: { term: album.name }, session: valid_session
      json_response = JSON.parse(response.body)
      expect(response).to be_successful
      expect(json_response["meta"]["total"]).to eq(1)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      album = Album.create! valid_attributes
      get :show, params: { id: album.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Album' do
        expect do
          post :create, params: { album: valid_attributes }, session: valid_session
        end.to change(Album, :count).by(1)
      end

      it 'renders a JSON response with the new album' do
        post :create, params: { album: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(album_url(Album.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new album' do
        post :create, params: { album: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        FactoryBot.attributes_for(:album, name: 'updated_name')
      end

      it 'updates the requested album' do
        album = Album.create! valid_attributes
        put :update, params: { id: album.to_param, album: new_attributes }, session: valid_session
        album.reload
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
        expect(album.name).to eq('updated_name')
      end

      it 'renders a JSON response with the album' do
        album = Album.create! valid_attributes

        put :update, params: { id: album.to_param, album: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the album' do
        album = Album.create! valid_attributes

        put :update, params: { id: album.to_param, album: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested album' do
      album = Album.create! valid_attributes
      expect do
        delete :destroy, params: { id: album.to_param }, session: valid_session
      end.to change(Album, :count).by(-1)
    end
  end
end
