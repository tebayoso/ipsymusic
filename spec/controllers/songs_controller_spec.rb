# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SongsController, type: :controller do
  let!(:author) { FactoryBot.create(:artist) }

  # This should return the minimal set of attributes required to create a valid
  # Song. As you add validations to Song, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    FactoryBot.attributes_for(:song, author: author, author_id: author.id, author_type: author.class)
  end

  let(:invalid_attributes) do
    FactoryBot.attributes_for(:song, author: author, name: nil, author_id: author.id, author_type: author.class)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SongsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      song = Song.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      song = Song.create! valid_attributes
      get :show, params: { id: song.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Song' do
        expect do
          post :create, params: { song: valid_attributes }, session: valid_session
        end.to change(Song, :count).by(1)
      end

      it 'renders a JSON response with the new song' do
        post :create, params: { song: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(song_url(Song.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new song' do
        post :create, params: { song: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        FactoryBot.attributes_for(:song, author: author)
      end

      it 'updates the requested song' do
        song = Song.create! valid_attributes
        put :update, params: { id: song.to_param, song: new_attributes }, session: valid_session
        song.reload
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
        expect(song.name).to eq(new_attributes[:name])
      end

      it 'renders a JSON response with the song' do
        song = Song.create! valid_attributes

        put :update, params: { id: song.to_param, song: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the song' do
        song = Song.create! valid_attributes

        put :update, params: { id: song.to_param, song: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested song' do
      song = Song.create! valid_attributes
      expect do
        delete :destroy, params: { id: song.to_param }, session: valid_session
      end.to change(Song, :count).by(-1)
    end
  end
end
