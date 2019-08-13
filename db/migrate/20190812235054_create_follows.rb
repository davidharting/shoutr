class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.references :follower, index: true, foreign_key: { to_table: :users }, null: false
      t.references :followed_user, index: true, foreign_key: { to_table: :users }, null: false
      t.timestamps
    end
  end
end
