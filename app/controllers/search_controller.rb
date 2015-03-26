class SearchController < ApplicationController

  def search_form
    if params['/search_form'] && !params['/search_form']['q'].nil?
      @users = User.search params['/search_form']['q']
    else
      @users = []
    end
  end

  # def self.search(query)
  #   __elasticsearch__.search(
  #     {
  #       query: {
  #         multi_match: {
  #           query: query,
  #           fields: ['title^10', 'text']
  #         }
  #       }
  #     }
  #   )
  # end

end
