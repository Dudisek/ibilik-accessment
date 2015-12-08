def  current_user
	if session[:user_id]
		@current_user ||= User.find_by_id(session[:user_id])
	end
end

def logged_in?
	!current_user.nil?
end

def authentication? (user_id)
	current_user.id == user_id
	
end
