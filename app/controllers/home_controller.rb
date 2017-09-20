class HomeController < ApplicationController
  def index
    @filterrific = initialize_filterrific(
      Article.includes_author,
      params[:filterrific],
      select_options: {
        sorted_by: Article.options_for_sorted_by,
        with_clients: Client.options_for_select,
        with_social_networks: SocialNetwork.options_for_social_network,
        with_person_group: PersonGroup.options_for_person_group
      }
    ) || return
    @articles = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end
end
