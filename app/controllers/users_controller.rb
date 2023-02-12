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

  def add_user
    input_username = params.fetch("input_username")

    new_user = User.new
    new_user.username = input_username
    new_user.save

    redirect_to( "/users/" + input_username)
  end

  def update
    the_id = params.fetch("modify_id")
    matching_user = User.where({ :id => the_id})
    the_user_update = matching_user.first

    updated_user = params.fetch("new_user")

    the_user_update.username = updated_user

    the_user_update.save

    redirect_to( "/users/" + the_user_update.username )
  end

  def home
    redirect_to( "/users")
  end

end
