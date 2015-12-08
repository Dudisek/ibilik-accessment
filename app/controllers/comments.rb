# ADD COMMENT
post '/comments' do	
	# @user = current_user
	@comment = current_user.comments.new(comment: params[:comment], property_id: params[:property_id])
  	if @comment.save
		redirect "/properties/#{@comment.property_id}"
		# redirect "/q/#{current_user.id}"
	else
		@error = "Please type your comment first."
		redirect "/properties/#{@comment.property_id}?errors=#{@error}"
	end
		# /users/login?errors=#{@errors}
end


# VIEW EDIT FORM - COMMENT
get "/comments/:id/edit" do
	@comment = Comment.find(params[:id])
		if @comment.user_id == current_user.id
			erb :"comment/edit"
		else
			erb :"404"
		end
end

# SEND EDIT COMMENT
patch "/comments/:id" do
	comment = Comment.find(params[:id])
	comment.update(comment: params[:comment])
	comment.save
	redirect "/properties/#{comment.property_id}"
	# ********ADD ERRROR if not save
end

#DELETE PROPERTY
delete "/comments/:id" do
	comment = Comment.find(params[:id])
	if current_user.id == comment.user_id
		comment.destroy
		redirect "/properties/#{comment.property_id}"
	else
		erb :"404"
	end
end