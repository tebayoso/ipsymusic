class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :name
      t.references :author, polymorphic: true
      t.integer :duration
      t.datetime :date

      t.timestamps
    end
  end
end
