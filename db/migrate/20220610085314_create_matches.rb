class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :user, foreign_key: true
      t.references :good, foreign_key: true
      t.timestamps
    end
  end
end
