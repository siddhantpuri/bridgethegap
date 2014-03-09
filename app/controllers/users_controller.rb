class UsersController < Devise::SessionsController
# before_filter :authenticate_user!, :except => [:create] 

  def create
    super
  end

 def update
   #edit here
 end

 def show
 	logger.debug "WHAAT!!!???"
 	if current_user?
 		redirect_to user_path, :method => "GET"
 	end

 end
end