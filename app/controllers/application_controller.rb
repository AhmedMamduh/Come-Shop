class ApplicationController < ActionController::Base
	before_action :authorize

	protected

	def authorize
		unless User.find_by(id: session[:user_id])
			if User.count.zero?
	  			redirect_to new_user_path, notice: "Please add first admin" and return
	  		end
			redirect_to login_url, notice: "Please log in" and return
		end
	end

end
