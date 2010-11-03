class PagesController < ApplicationController
  before_filter :non_signed_in_user, :only => [:home]
    
  def home
  end

  def contact
  end

 

end
