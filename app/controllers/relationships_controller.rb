class RelationshipsController < ApplicationController
	
	def create
		following = current_user.follow(@user)
		if following.save
			flash[:notice] = "ユーザーをフォローしました"
			redirect_to @user
		else
			flash[:notice] = "ユーザーのフォローに失敗しました"
			redirect_to @user
		end
	end

	def destroy
		following = current_user.unfollow(@user)
		if following.save
			flash[:notice] = "ユーザーのフォローを解除しました"
			redirect_to @user
		else
			flash[:notice] = "ユーザーのフォロー解除に失敗しました"
			redirect_to @user
		end
	end

	private
	def 
		@user = User.find(params[:relationships][:follow_id])
	end
end
