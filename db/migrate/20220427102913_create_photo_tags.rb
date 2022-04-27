class CreatePhotoTags < ActiveRecord::Migration[6.1]
  def change
    create_table :photo_tags do |t|
      t.references :photo, type: :bigint, foreign_key: true
      t.references :tag, type: :bigint, foreign_key: true

      t.timestamps
    end
  end
end
