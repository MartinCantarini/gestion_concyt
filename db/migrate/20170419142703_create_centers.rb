class CreateCenters < ActiveRecord::Migration[5.0]
  def change
    create_table :centers do |t|
      t.string :nombre
      t.string :siglas
      t.string :director
      t.integer :inscripto, default: 0
      t.timestamps
    end
  end
end
