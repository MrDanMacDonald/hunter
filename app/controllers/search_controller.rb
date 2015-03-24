class SearchController < ApplicationController

  # TODO: search multiple models at once
  def search
    if params[:q].nil?
      @users = []
    else
      @users = User.search params[:q]
    end
  end
end
