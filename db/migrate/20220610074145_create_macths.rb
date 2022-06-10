class CreateMacths < ActiveRecord::Migration[6.0]
  def change
    create_table :macths do |t|
      t.references :user, foreign_key: true
      t.references :good, foreign_key: true
      t.timestamps
    end
  end
end
