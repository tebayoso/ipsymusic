class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.string :name
      t.text :bio
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
