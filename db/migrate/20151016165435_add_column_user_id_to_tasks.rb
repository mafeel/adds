class AddColumnUserIdToTasks < ActiveRecord::Migration
  def change
    add_column :adds, :user_id, :integer
  end
end
