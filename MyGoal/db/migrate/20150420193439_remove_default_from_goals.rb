class RemoveDefaultFromGoals < ActiveRecord::Migration
  def change
    change_column_default :goals, :private, nil
  end
end
