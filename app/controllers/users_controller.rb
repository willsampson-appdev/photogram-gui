class UsersController < ApplicationController
  def index

    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc})

    render({ :template => "user_templates/index.html.erb"})
  end

  def details 
    url_username = params.fetch("user_id")
    matching_users = User.where({ :username => url_username})
    @the_user = matching_users.at(0)
    render({ :template => "user_templates/show_details.html.erb"})
  end 

end
