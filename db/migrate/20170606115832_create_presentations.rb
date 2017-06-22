class CreatePresentations < ActiveRecord::Migration[5.0]
  def change
    create_table :presentations do |t|
      t.string :titulo
      t.string :estado
      t.references :session, foreign_key: true
      t.references :state, foreign_key: true, default:1
      t.references :exposition, foreign_key: true
      t.timestamps
    end
  end
end
