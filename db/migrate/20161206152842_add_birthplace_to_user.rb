class AddBirthplaceToUser < ActiveRecord::Migration
  def change
    add_column :users, :birthplace, :string
  end
end
