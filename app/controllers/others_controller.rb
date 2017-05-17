class OthersController < ApplicationController
before_action :authenticate_user!
  def home
  	if user_signed_in?
  		@tiene_poster=false;
  		Poster.all.each do |p|
  			if p.user_id==current_user.id
  				@tiene_poster=true;
  			end
  		end
  	else

  	end
  end
end
