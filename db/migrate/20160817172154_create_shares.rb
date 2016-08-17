class CreateShares < ActiveRecord::Migration[5.0]
  def change
    create_table :shares do |t|
      t.references :podcast, index: true, null: false
      t.references :sender, as: :user, index: true, null: false
      t.references :recipient, as: :user, index: true, null: false

      t.timestamps
    end
  end
end
