# frozen_string_literal: true

Artist.destroy_all
Album.destroy_all
Song.destroy_all
Playlist.destroy_all
Band.destroy_all
Artist.reindex
Album.reindex
Song.reindex
Playlist.reindex
Band.reindex
puts "Creating Artists"
artists = FactoryBot.create_list(:artist, 100)
artists.each do |art|
  puts "creating Songs and Albums for Artist: #{art.id}"
  10.times do
    album = FactoryBot.create(:album, author: art)
    songs = FactoryBot.create_list(:song, 10, author: art)
    album.songs << songs
  end
end
puts "Creating playlists"
playlists = FactoryBot.create_list(:playlist, 1000)
playlists.each do |playl|
  puts "Adding songs to playlist #{playl.id}"
  playl.songs << Song.order('RAND()').limit(10)
end
Artist.reindex
Album.reindex
Song.reindex
Playlist.reindex
Band.reindex
