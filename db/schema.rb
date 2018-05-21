# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_05_21_130215) do

  create_table "album_songs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "song_id"
    t.bigint "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_album_songs_on_album_id"
    t.index ["song_id"], name: "index_album_songs_on_song_id"
  end

  create_table "albums", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "author_type"
    t.bigint "author_id"
    t.integer "duration"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_albums_on_author_type_and_author_id"
  end

  create_table "artist_bands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "band_id"
    t.datetime "joined"
    t.datetime "left"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_bands_on_artist_id"
    t.index ["band_id"], name: "index_artist_bands_on_band_id"
  end

  create_table "artists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.datetime "birthdate"
    t.string "alter_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playlist_songs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "song_id"
    t.bigint "playlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id"], name: "index_playlist_songs_on_playlist_id"
    t.index ["song_id"], name: "index_playlist_songs_on_song_id"
  end

  create_table "playlists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "author"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "author_type"
    t.bigint "author_id"
    t.integer "duration"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_songs_on_author_type_and_author_id"
  end

  add_foreign_key "album_songs", "albums"
  add_foreign_key "album_songs", "songs"
  add_foreign_key "artist_bands", "artists"
  add_foreign_key "artist_bands", "bands"
  add_foreign_key "playlist_songs", "playlists"
  add_foreign_key "playlist_songs", "songs"
end
