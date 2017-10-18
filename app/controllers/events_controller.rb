class EventsController < ApplicationController
  def show
  	firstres = HTTParty.get("http://devapi.wearecatchapp.com/catchapp-server/api/unauth/login?username=&password=")
  	auth = firstres.body.inspect.split('\\')[11].gsub(/"/, '')
  	@event = HTTParty.get("http://devapi.wearecatchapp.com/catchapp-server/api/event/opensearch?external_code=LUPLCE")
    # , 
  		#       "headers": {
    #       "Authorization"=> "#{auth}"
    #     })

    #  date and time extraction
    @hour_start = Time.at(@event["event"]["start_date"]).to_datetime.hour
    @min_start = Time.at(@event["event"]["start_date"]).to_datetime.min
    @hour_end = Time.at(@event["event"]["end_date"]).to_datetime.hour
    @min_end = Time.at(@event["event"]["end_date"]).to_datetime.min
    @num_start = Time.at(@event["event"]["start_date"]).to_datetime.day
    @num_end = Time.at(@event["event"]["end_date"]).to_datetime.day
    @start_day = Date::DAYNAMES[Time.at(@event["event"]["start_date"]).to_datetime.wday]
    @end_day = Date::DAYNAMES[Time.at(@event["event"]["end_date"]).to_datetime.wday]
  	@start_month = Date::MONTHNAMES[Time.at(@event["event"]["start_date"]).to_datetime.month]
    @start_month_big = Date::MONTHNAMES[Time.at(@event["event"]["start_date"]).to_datetime.month].chars.take(3).join.upcase
    @end_month = Date::MONTHNAMES[Time.at(@event["event"]["end_date"]).to_datetime.month] 
    @year_start = Time.at(@event["event"]["start_date"]).to_datetime.year
    @year_end = Time.at(@event["event"]["end_date"]).to_datetime.year
    @end_time = Time.at(@event["event"]["end_of_life_date"]).to_datetime

    # organizer level
    level = @event["event"]["creator_level"]
    case level
    when 1
      @level_image = "Level_1H.png"
    when 2
      @level_image = "Level_1H.png"
    when 3
      @level_image = "Level_1H.png"
    when 4
      @level_image = "Level_1H.png"
    when 5
      @level_image = "Level_1H.png"
    when 6
      @level_image = "Level_6H.png"
    when 7
      @level_image = "Level_1H.png"
    when 8
      @level_image = "Level_1H.png"
    when 9
      @level_image = "Level_1H.png"
    when 10
      @level_image = "Level_1H.png"
    end
  end
end

def user_params
  params.require(:pic).permit(:image)
end
