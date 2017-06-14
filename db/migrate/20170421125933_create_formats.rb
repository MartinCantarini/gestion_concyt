class CreateFormats < ActiveRecord::Migration[5.0]
  def change
    create_table :formats do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
