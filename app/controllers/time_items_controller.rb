class TimeItemsController < ApplicationController
  helper_method :get_current_time

  def index
    @alltimes = TimeItem.all
  end

  def new
    @currenttime = TimeItem.new
    if session[:currenttime_start] != nil
      @currenttime.start = session[:currenttime_start]
    end
  end

  def start
    @currenttime = TimeItem.new
    @currenttime.start = DateTime.now
    session[:currenttime_start] = @currenttime.start
    render plain: session[:currenttime_start].getlocal.strftime("%F %T")
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
  end

  def get_current_time
    render plain: DateTime.now.getlocal.strftime("%F %T")
  end

end
