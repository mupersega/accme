class CreateQualifications < ActiveRecord::Migration[6.1]
  def change
    create_table :qualifications do |t|
      t.string :name
      t.integer :weight

      t.timestamps
    end
  end
end
