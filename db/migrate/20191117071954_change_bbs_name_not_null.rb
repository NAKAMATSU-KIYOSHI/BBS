class ChangeBbsNameNotNull < ActiveRecord::Migration[6.0]
  def change
  	change_column_null :bbs, :name, false
  end
end
