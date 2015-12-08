# VIEW ADD BOOKIG
get "/bookings/:id" do
	@booking = Booking.find(params[:id])
	erb :'booking/book'
end

# ADD BOOKIMG
post "/bookings" do
	booking = current_user.bookings.new(from: params[:from], to: params[:to], property_id: params[:property_id])
	if booking.save
		redirect "/properties/#{booking.property_id}" 
	else
	@errors = user.errors.full_messages
	erb :'property/add'
	end
end 


# VIEW EDIT FORM - BOOKING
get "/bookings/:id/edit" do
	@booking = Booking.find(params[:id])
		if @booking.user_id == current_user.id
			erb :"booking/edit"
		else
			erb :"404"
		end
end

# SEND EDIT COMMENT
patch "/bookings/:id" do
	booking = Booking.find(params[:id])
	booking.update(from: params[:from], to: params[:to])
	booking.save
	redirect "/users/#{booking.user_id}"
	# ********ADD ERRROR if not save
end

#DELETE PROPERTY
delete "/bookings/:id" do
	booking = Booking.find(params[:id])
	if current_user.id == booking.user_id
		booking.destroy
		redirect "/users/#{booking.user_id}"
	else
		erb :"404"
	end
end