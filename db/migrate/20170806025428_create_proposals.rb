class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals do |t|
      t.text :message
      t.string :status, default: "Em Análise"
      t.text :notes
      t.references :desire, foreign_key: true
      t.string :img1, default: "Nao_Enviada"
      t.string :img2, default: "Nao_Enviada"
      t.string :img3, default: "Nao_Enviada"
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
