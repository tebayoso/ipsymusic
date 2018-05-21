class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :author
      t.datetime :date

      t.timestamps
    end
  end
end
