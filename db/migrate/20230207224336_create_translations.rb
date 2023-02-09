class CreateTranslations < ActiveRecord::Migration[7.0]
  def change
    create_table :translations do |t|
      t.string :titolo
      t.string :tipo
      t.integer :stagione
      t.integer :episodio
      t.references :user, :revisore, null: false, foreign_key: { to_table: :users }
      t.references :user, :traduttore, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
