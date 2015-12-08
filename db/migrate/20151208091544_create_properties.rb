class CreateProperties < ActiveRecord::Migration
	def change
			create_table :properties do |t|
			t.string :title
			t.string :body
			t.timestamps null: false

			t.belongs_to :user
		end
	end
end
