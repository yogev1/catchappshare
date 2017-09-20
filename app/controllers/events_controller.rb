class EventsController < ApplicationController
  def show
  	firstres = HTTParty.get("http://devapi.wearecatchapp.com/catchapp-server/api/unauth/login?username=logicsports@icloud.com&password=zzz123")
  	auth = firstres.body.inspect.split('\\')[11].gsub(/"/, '')
  	@event = HTTParty.get("http://devapi.wearecatchapp.com/catchapp-server/api/event/search?external_code=Xbkqsz", 
  		      "headers": {
          "Authorization"=> "#{auth}"
        })
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
  end
end

def user_params
  params.require(:pic).permit(:image)
end