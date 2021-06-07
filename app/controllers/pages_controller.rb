class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @nfts = Nft.all
    if params[:name].present?
      @users = User.search_by_first_and_last_name(params[:name])
    end
end
end

# sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
    # if params[:name] != ""
      # @users = User.where(sql_query, query: "#{params[:name]}")
    # end
  # end

