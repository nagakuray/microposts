class RemoveConstellationFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :constellation, :string
  end
end
