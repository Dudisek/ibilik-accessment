class CreateComments < ActiveRecord::Migration
	def change
			create_table :comments do |t|
			t.string :comment
			t.timestamps null: false

			t.belongs_to :user
			t.belongs_to :property
		end
	end
end