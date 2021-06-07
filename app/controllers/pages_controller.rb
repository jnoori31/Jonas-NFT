class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:nft_category].present?
      @nfts = Nft.where(category: params[:nft_category])
    else 
      @nfts = Nft.all
    end
    if params[:name].present?
      @users = User.search_by_first_and_last_name(params[:name])
    end
    @categories_nft = %w(music art sport cinema)
    users = User.all
    @user_suggestions = []
    for i in 0...users.length
      if users[i] != current_user
        @user_suggestions << users[i]
      end
    end
  end
end


