class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string        :name
      t.string        :image
      t.string        :text
      t.timestamps
    end
  end
end
