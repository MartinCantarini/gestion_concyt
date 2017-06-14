class CreatePosters < ActiveRecord::Migration[5.0]
  def change
    create_table :posters do |t|
      t.string :identificador
      t.string :fuente
      t.string :formato
      t.string :titulo
      t.string :autor
      t.string :coautor1
      t.string :coautor2
      t.string :coautor3
      t.string :coautor4
      t.string :coautor5
      t.string :institucion
      t.text :introduccion
      t.text :objetivos
      t.text :metodologia
      t.text :resultados
      t.text :conclusiones
      t.attachment :logo
      t.attachment :img1a
      t.attachment :img1b
      t.attachment :img2
      t.boolean :finalizado, :default => false
      t.references :session, foreign_key: true
      t.timestamps
    end
  end
end
