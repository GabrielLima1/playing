class AddCreditToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :credit, :integer
    add_column :users, :name, :string
    add_column :users, :kind, :string, default: "client"
    add_column :users, :status, :string, default: "active"
    add_column :users, :plan, :string
  end
end
