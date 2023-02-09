class CreateTranslations < ActiveRecord::Migration[7.0]
  def change
    create_table :translations do |t|
      t.string :titolo
      t.string :tipo
      t.integer :stagione
      t.integer :episodio
      t.integer :revisore_id, null: false, foreign_key: { to_table: :users }
      t.integer :traduttore_id, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
