artists = FactoryBot.create_list(:artist, 1000)
artists.each do |art|
  10.times do
    album = FactoryBot.create(:album, author: art)
    songs = FactoryBot.create_list(:song, 10, author: art)
    album.songs << songs
  end
end
playlists = FactoryBot.create_list(:playlist, 100)
playlists.each do |playl|
  playl.songs << Song.order("RAND()").limit(10)
end
