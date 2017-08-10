class CreateDesires < ActiveRecord::Migration[5.0]
  def change
    create_table :desires do |t|
      t.string :title
      t.string :action
      t.text :description
      t.string :status, default: "Em Análise"
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.string :img1, default: "Não Enviada"
      t.string :img2, default: "Não Enviada"
      t.string :img3, default: "Não Enviada"

      t.timestamps
    end
  end
end
