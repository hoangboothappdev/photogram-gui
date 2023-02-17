class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order ({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb"})
  end

  # get("/users/:path_id", { :controller => "photos", :action => "show"})

  def show

    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id })
    
    @the_photo = matching_photos.at(0)
    
    render({ :template => "photo_templates/show.html.erb"})
  end


#delete photos # get("/delete_photo/:path_id", { :controller => "photos", :action => "delete"})

  def delete
  
    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id })
    @the_photo = matching_photos.at(0)

    @the_photo.destroy

   # render({ :template => "photo_templates/baii.html.erb"})
    redirect_to("/photos") 

  end

  #insert photos
  # get("/insert_photo_record", { :controller => "photos", :action => "insert"})

  def insert
    
    input_photo_url = params.fetch("input_image")
    input_photo_caption = params.fetch("input_caption")
    input_photo_owner_id = params.fetch("input_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_photo_url
    a_new_photo.caption = input_photo_caption
    a_new_photo.owner_id = input_photo_owner_id

    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s) 
  
  end




end
