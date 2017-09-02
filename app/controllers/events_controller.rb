class EventsController < ApplicationController
  def show
  	auth = HTTParty.get('http://devapi.wearecatchapp.com/catchapp-server/api/unauth/login?username=logicsports@icloud.com&password=zzz123')
	response = HTTParty.get("http://devapi.wearecatchapp.com/catchapp-server/api/user/search.json", digest_auth: auth)
	puts response
  	 
  end
end

def user_params
  params.require(:pic).permit(:image)
end