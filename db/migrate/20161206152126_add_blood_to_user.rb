class AddBloodToUser < ActiveRecord::Migration
  def change
    add_column :users, :blood, :string
  end
end
