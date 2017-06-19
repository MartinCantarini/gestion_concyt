class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :leido, default:0
      t.text :cuerpo
      t.boolean :para_administrador, default:false
      t.references :presentation, foreign_key: true
      t.references :session, foreign_key: true
      #t.references :message, foreign_key: true
      t.timestamps
    end
  end
end
