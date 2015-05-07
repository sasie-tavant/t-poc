class ChangeColumnPodiumsToIntegerInTeams < ActiveRecord::Migration

  def change
    change_column :teams, :podiums, :integer
  end

end
