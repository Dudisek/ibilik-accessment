# VIEW ADD PROPERTY
get "/properties/add" do
	erb :'property/add'
end


# ADD PROPERTY
post "/properties" do
	property = Property.new(title: params[:title], body: params[:body])
	if property.save
		redirect "/property/#{property.id}" 
	else
	@errors = user.errors.full_messages
	erb :'property/add'
	end
end 

# VIEW UPDATE PROPERTY
get "/property/:id" do
	@property = Property.find(params[:id])
	erb :"property/view"
end

# UPDATE PROPERTY


# DELETE PROPERTY
