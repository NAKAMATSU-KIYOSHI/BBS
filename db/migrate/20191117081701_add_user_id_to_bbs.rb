class AddUserIdToBbs < ActiveRecord::Migration[6.0]
  def up
  	execute 'DELETE FROM bbs;'
  	add_reference :bbs, :user, null: false, index: true
  end

  def down
  	remove_reference :bbs, :user, index: true
  end
end