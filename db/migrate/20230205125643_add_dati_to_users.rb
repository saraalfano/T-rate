class AddDatiToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :nome, :string
    add_column :users, :cognome, :string
    add_column :users, :ruolo, :string, default: "Utente"
    add_column :users, :score, :float, default: 0.0
  end
end
