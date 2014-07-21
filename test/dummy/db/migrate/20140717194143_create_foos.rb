class CreateFoos < ActiveRecord::Migration
  def change
    create_table :foos do |t|
      t.attachment :image
      t.timestamps
    end
  end
end
