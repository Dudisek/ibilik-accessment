class CreateBookings < ActiveRecord::Migration
	def change
			create_table :bookings do |t|
			t.timestamps null: false
			t.string :from
			t.string :to
			t.belongs_to :user
			t.belongs_to :property
		end
	end
end
