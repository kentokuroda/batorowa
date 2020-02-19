class CreateMicroposts < ActiveRecord::Migration[5.2]
  def change
    create_table :microposts do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.string :platform
      t.string :content

      t.timestamps
    end
  end
end
