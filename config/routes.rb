Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index"})

  get("/users", { :controller => "users", :action => "index"})

  get("/users/:path_username", { :controller => "users", :action => "show"})

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_id", { :controller => "photos", :action => "show"})

#delete photos
  get("/delete_photo/:path_id", { :controller => "photos", :action => "delete"})

#insert photos
  get("/insert_photo_record", { :controller => "photos", :action => "insert"})

end
