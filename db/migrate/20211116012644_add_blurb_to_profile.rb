class AddBlurbToProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :blurb, :string
  end
end
