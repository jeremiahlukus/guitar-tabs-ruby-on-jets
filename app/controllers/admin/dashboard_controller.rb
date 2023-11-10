class Admin::DashboardController < AdminController
  def show
    @users = User.all
    @new_users = User.where('created_at > ?', 1.month.ago)
    #@online_users = User.where('last_seen > ?', 15.minutes.ago)
    @admin_users = User.where(admin: true)
    @songs = Song.all
    @songs_with_urls = Song.where.not(url: [nil, ''])
    @users_with_songs = User.joins(:songs).distinct
  end
end
