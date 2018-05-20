class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.references :author, polymorphic: true
      t.integer :duration
      t.datetime :date

      t.timestamps
    end
  end
end
