class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
    	t.string :title
    	t.string :description
    	t.string :password
    	t.boolean :active, default: false
    	t.date :date_for
      t.timestamps null: false
    end
  end
end
