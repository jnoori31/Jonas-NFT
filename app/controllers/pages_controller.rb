class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @nfts = Nft.all
    if params[:name].present?
      @users = User.search_by_first_and_last_name(params[:name])
    end
  end
end


