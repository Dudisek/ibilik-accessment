# VIEW REGISTRATION FORM

get "/users/registration" do
	erb :'user/registration'
end

# CREATE NEW USER
post "/users" do
	user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
	if user.save
		session[:user_id] = user.id
		redirect "/users/#{user.id}" 
	else
	@errors = user.errors.full_messages
	erb :'user/registration'
	end
end 

# VIEW PROFILE
get "/users/:id" do
	@user = User.find(params[:id])
	erb :"user/profile"
end

# VIEW UPDATE USER
get "/users/:id/edit" do
	@user = User.find(params[:id])
	if current_user.id == @user.id
		erb :'user/edit'
	else
		erb :"404"
	end		
end

# UPDATE USER
patch "/users/:id" do
	user = User.find(params[:id])
	user.update(name: params[:name], email: params[:email], password: params[:password])
	if user.save
		redirect "/users/#{user.id}" 
	else
		@errors = user.errors.full_messages
		erb :"404"
	end
	puts 
end

# DELETE USER
delete "/users/:id" do
	user = User.find(params[:id])
	if current_user.id == user.id
		user.destroy
		erb :"static/index"
	else
		erb :"404"
	end
end


# VIEW LOGIN PAGE
get "/login" do
	erb :"user/login"
end

# LOGIN DATA
post "/login" do
	if user = User.find_by(email: params[:email])
		if user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect "/users/#{user.id}"
		else
			@errors = "password-not-match"
			redirect "/users/login?errors=#{@errors}"
		end
	else
		errors = "email-not-exist"
		redirect "/users/login?errors=#{errors}"
	end
end


# LOG OUT
delete "/logout" do
	session[:user_id] = nil
	redirect "/"
end





