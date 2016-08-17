class PodcastMailer < ApplicationMailer
  default from: 'podpalsapp@gmail.com'

  def share_podcast(user)
    @user = user
    @url = url
    mail(to: @user.email, subject: 'PodPals: New Podcast Shared with you!')
  end
end
