module ApplicationHelper
  
  def format_date_short(date, use_time = false)
        if use_time == true
          ampm = date.strftime("%p").downcase
          new_date = date.strftime("%b %d at %I:%M" + ampm)
        else
          new_date = date.strftime("%b %d")
        end
  	end

  	def format_date_long(date, use_time = false)
  		if use_time == false
  		  date_long = date.strftime("%d %B %Y at %H:%M")
  		else
  		  date_long = date.strftime("%d %B %Y")
  		end
  	end

  	def format_iso_date(date)
  		iso_date = date.strftime("%Y-%m-%d")
  	end
  
  
end
