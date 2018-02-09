class CreateThingTags < ActiveRecord::Migration
  def change
    create_table :thing_tags do |t|
      t.references :tag
      t.references :thing

      t.timestamps null: false
    end
  end
end
