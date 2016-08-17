class PodcastMailer < ApplicationMailer
  default from: 'podpalsapp@gmail.com'

  def share_podcast(user, podcast)
    @user = user
    @podcast = podcast
    @url = "http://podpals.herokuapp.com/podcasts/#{podcast.id}"
    mail(to: @user.email, subject: 'PodPals: New Podcast Shared with you!')
  end
end
