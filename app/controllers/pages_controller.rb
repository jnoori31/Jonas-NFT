class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
    if params[:name] != ""
      @users = User.where(sql_query, query: "#{params[:name]}")
    end
  end
end
