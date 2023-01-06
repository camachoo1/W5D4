class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.references :user, null: false, foreign_key: {to_table: :users}
      t.references :short_url, null: false, foreign_key: {to_table: :shortened_urls}
      t.timestamps
      t.index [:user_id, :short_url_id], unique: true
    end
  end
end
