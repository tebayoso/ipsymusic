require 'rails_helper'

RSpec.describe "Songs", type: :request do
  describe "When requestin songs to the API" do
    it "returns the list of songs if the index is requested" do
      artist = FactoryBot.create(:artist)
      FactoryBot.create_list(:song, 10, author: artist)
      get songs_path

      expect(response).to have_http_status(200)
    end

    it "returns a single song if the id is passed" do
      artist = FactoryBot.create(:artist)
      song = FactoryBot.create(:song, author: artist)
      get song_path(song)

      expect(response).to have_http_status(200)
    end
  end
end
