class EventsController < ApplicationController
  def show		 
  end
end

def user_params
  params.require(:pic).permit(:image)
end