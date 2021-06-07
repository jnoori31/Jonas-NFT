class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @nfts = Nft.all
    if params[:name].present?
      @users = User.search_by_first_and_last_name(params[:name])
    end
    @categories_nft = @@categories_nft
    users = User.all
    @user_suggestions = []
    for i in 0...users.length
      if users[i] != current_user
        @user_suggestions << users[i]
      end
    end
  end
end


