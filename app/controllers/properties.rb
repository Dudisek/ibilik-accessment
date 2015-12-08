# VIEW ADD PROPERTY
get "/properties/add" do
	erb :'property/add'
end


# ADD PROPERTY
post "/properties" do
	@user = current_user
	property = current_user.properties.new(title: params[:title], body: params[:body])
	if property.save
		redirect "/properties/#{property.id}" 
	else
	@errors = user.errors.full_messages
	erb :'property/add'
	end
end 

# VIEW PROPERTY
get "/properties/:id" do

	@property = Property.find(params[:id])
	@user = User.find(@property.user_id)
	erb :"property/view"
end


# VIEW EDIT FORM - PROPERTIES
get "/properties/:id/edit" do
	@property = Property.find(params[:id])
		if @property.user_id == current_user.id
			erb :"property/edit"
		else
			erb :"404"
		end
end

# SEND EDIT PROPERTIES
patch "/properties/:id" do
	property = Property.find(params[:id])
	property.update(title: params[:title], body: params[:body])
	redirect "/properties/#{property.id}"
	# ********ADD ERRROR if not save
end

#DELETE PROPERTY
delete "/properties/:id" do
	property = Property.find(params[:id])
	if current_user.id == property.user_id
		property.destroy
		redirect "/users/#{current_user.id}"
	else
		erb :"404"
	end
end
