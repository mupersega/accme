class AddPhoneToProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :phone, :string
  end
end
