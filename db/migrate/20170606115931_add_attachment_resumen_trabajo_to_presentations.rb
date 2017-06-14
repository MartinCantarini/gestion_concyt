class AddAttachmentResumenTrabajoToPresentations < ActiveRecord::Migration
  def self.up
    change_table :presentations do |t|
      t.attachment :resumen
      t.attachment :trabajo
    end
  end

  def self.down
    remove_attachment :presentations, :resumen
    remove_attachment :presentations, :trabajo
  end
end
