# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlaylistsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Playlist. As you add validations to Playlist, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    FactoryBot.attributes_for(:playlist)
  end

  let(:valid_attributes_with_songs) do
    artist = FactoryBot.create(:artist)
    songs = FactoryBot.create_list(:song, 10, author: artist)
    FactoryBot.attributes_for(:playlist).merge(song_ids: songs)
  end

  let(:invalid_attributes) do
    FactoryBot.attributes_for(:playlist, name: nil)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PlaylistsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      playlist = Playlist.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      playlist = Playlist.create! valid_attributes
      get :show, params: { id: playlist.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Playlist' do
        expect do
          post :create, params: { playlist: valid_attributes }, session: valid_session
        end.to change(Playlist, :count).by(1)
      end

      it 'renders a JSON response with the new playlist' do
        post :create, params: { playlist: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(playlist_url(Playlist.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new playlist' do
        post :create, params: { playlist: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with a song list' do
      it 'adds the songs to the list' do
        post :create, params: { playlist: valid_attributes_with_songs }, session: valid_session
        expect(response).to have_http_status(:created)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        FactoryBot.attributes_for(:playlist)
      end

      it 'updates the requested playlist' do
        playlist = Playlist.create! valid_attributes
        put :update, params: { id: playlist.to_param, playlist: new_attributes }, session: valid_session
        playlist.reload
        expect(response.content_type).to eq('application/json')
        expect(playlist.name).to eq(new_attributes[:name])
      end

      it 'renders a JSON response with the playlist' do
        playlist = Playlist.create! valid_attributes

        put :update, params: { id: playlist.to_param, playlist: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end
    context 'with a different song list' do
      let(:new_attributes_with_songs) do
        artist = FactoryBot.create(:artist)
        songs = FactoryBot.create_list(:song, 2, author: artist)
        FactoryBot.attributes_for(:playlist).merge(song_ids: songs)
      end

      it 'updates the song list for the playlist' do
        playlist = Playlist.create! valid_attributes

        put :update, params: { id: playlist.to_param, playlist: new_attributes_with_songs }, session: valid_session
        playlist.reload
        expect(response.content_type).to eq('application/json')
        expect(playlist.songs.count).to eq(2)
      end
    end
  end

  context 'with invalid params' do
    it 'renders a JSON response with errors for the playlist' do
      playlist = Playlist.create! valid_attributes

      put :update, params: { id: playlist.to_param, playlist: invalid_attributes }, session: valid_session
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested playlist' do
      playlist = Playlist.create! valid_attributes
      expect do
        delete :destroy, params: { id: playlist.to_param }, session: valid_session
      end.to change(Playlist, :count).by(-1)
    end
  end
end
