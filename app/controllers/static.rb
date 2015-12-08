get '/' do
	@user = User.all
	@properties = Property.all
  erb :"static/index"
end