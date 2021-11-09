class CreateProfileQualifications < ActiveRecord::Migration[6.1]
  def change
    create_table :profile_qualifications do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :qualification, null: false, foreign_key: true
      t.references :major, null: false, foreign_key: true

      t.timestamps
    end
  end
end
