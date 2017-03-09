class NotificationsController < ApplicationController
  def index
    # set a random user_id in signed cookie, if not already set
    # cookies.signed[:user_id] ||= [DateTime.now.strftime('%Q'), rand(100)].join('-')
  end
end
