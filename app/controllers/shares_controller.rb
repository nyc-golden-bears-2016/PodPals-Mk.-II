class SharesController < ApplicationController
	def create
		@podcast = Podcast.find(params[:podcast_id])
		share_params = {podcast_id: @podcast.id, sender_id: current_user.id, recipient_id: params[:share][:recipient_id]}
		@share = Share.new(share_params)
		if @share.save
			redirect_to @podcast,
			alert: "Share was successful!"
		else
			redirect_to request.referer,
			alert: "Share was unsuccessful"
		end
	end

	private

	def share_params
		params.require(:share).permit(:sender_id, :recipient_id, :podcast_id)
	end
end