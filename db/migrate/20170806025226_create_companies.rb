class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true
      t.string :logo, default: "Nao_Enviado"

      t.timestamps
    end
  end
end
