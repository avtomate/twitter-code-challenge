class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :keyword
      t.string :content
      t.string :url
      t.timestamps null: false
    end
  end
end
