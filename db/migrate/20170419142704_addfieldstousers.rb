class Addfieldstousers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :nombre, :string
    add_column :users, :apellido, :string
    add_column :users, :tipo_dni, :integer
    add_column :users, :dni, :string
    add_column :users, :telefono, :string
    add_column :users, :tipo_participacion, :integer
    add_reference :users, :authors, index: true
    add_column :users, :tipo_institucion, :integer
    add_column :users, :institucion, :string
    add_column :users, :rol, :integer, default: 1
    add_column :users, :acreditado, :integer, default: 0
    add_reference :users, :poster, index: true
    add_reference :users, :presentation, index: true
  end
end
