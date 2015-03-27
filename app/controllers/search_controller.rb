class SearchController < ApplicationController

  def search
    if search_params
      @users = User.search(name_cont: search_params).result
      @posts = Post.search(name_cont: search_params).result
    else
      @users = []
      @posts = []
    end
  end

  private

  def search_params
    if params['/search'] && !params['/search']['q'].nil?
      params['/search']['q']
    end
  end
end
