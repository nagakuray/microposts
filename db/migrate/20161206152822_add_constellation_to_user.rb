class AddConstellationToUser < ActiveRecord::Migration
  def change
    add_column :users, :constellation, :string
  end
end
