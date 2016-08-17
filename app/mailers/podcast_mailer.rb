class PodcastMailer < ApplicationMailer
  default from: 'podpalsapp@gmail.com'

  def share_podcast(user)
    @user = user
    @url = url
    mail(to: @user.email, subject: 'New Podcast Shared with you!')
  end
end
