class AddNavbarColorToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :navbar_color, :string, null: false, default: '#370617'
  end
end
