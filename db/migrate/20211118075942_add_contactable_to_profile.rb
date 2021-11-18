class AddContactableToProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :contactable, :boolean
  end
end
