class PhotosController < ApplicationController

  def index

    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc})
    render({ :template => "photo_templates/index.html.erb"})
  end

  def details
    url_id = params.fetch("photo_id")
    matching_photos = Photo.where({ :id => url_id })
    @the_photo = matching_photos.first
    render({ :template => "photo_templates/show_details.html.erb"})
  end

  def destroy
    the_id = params.fetch("photo_id")
    matching_photos = Photo.where({ :id => the_id })
    the_photo = matching_photos.first
    the_photo.destroy
    redirect_to("/photos")
  end

  def create
    
    input_image_new = params.fetch("input_image")
    input_caption_new = params.fetch("input_caption")
    input_owner_new = params.fetch("input_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image_new
    a_new_photo.caption = input_caption_new
    a_new_photo.owner_id = input_owner_new
    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)
  end 

  def update

    the_id = params.fetch("modify_id")
    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.first
    
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    
    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    redirect_to( "/photos/"+ the_photo.id.to_s)
  end

  def new_comment

  input_comment = params.fetch("comment_body")
  input_owner = params.fetch("comment_author")
  input_id = params.fetch("comment_pid")

    new_comment = Comment.new
    new_comment.author_id = input_owner
    new_comment.body = input_comment
    new_comment.id = input_id
    new_comment.save

    redirect_to( "/photos/" + new_comment.id.to_s )
  end

end
