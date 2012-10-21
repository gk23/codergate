# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :auth
  
  def auth
    logger.debug "user_id is #{session[:user_id]}, #{session[:user_id].nil?}"

    if not session[:user_id]
      flash[:notice] = "Hello -- this will show up fine"
      logger.error "should not come in the section."
      redirect_to "/login",:notice =>"请先登录!"
    end

    # redirect_to "/login",:flash=>{:notice=>"please log in first."} unless session[:user_id]
  end

  def load_notice
    @notice = Notice.last
    if !@notice.blank? and !@notice.end_at.blank?
      if @notice.end_at < Time.now
        @notice = nil
      end
    end
  end
end
