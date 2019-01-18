class TimeItemsController < ApplicationController
# require 'date'

  def index
    @alltimes = TimeItem.all
  end

  def new
    @currenttime = TimeItem.new
    if session[:currenttime] != nil
      @currenttime.start = session[:currenttime_start]
    end
  end

  def start
    @currenttime = TimeItem.new
    @currenttime.start = DateTime.now
    session[:currenttime_start] = @currenttime.start
    redirect_to new_time_item_path
  end

  def stop
    @currenttime = TimeItem.new
    if session[:currenttime_start] != nil
      @currenttime.start = session[:currenttime_start]
      @currenttime.end = DateTime.now
      if @currenttime.save
        flash[:notice] = "Time has been successfully recorded."
        session[:currenttime_start] = nil
      end
    else
      flash[:error] = "You must start the timer before you can stop!"
    end
    redirect_to new_time_item_path
  end

end
