Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "home"})

  get("/users", { :controller => "users", :action => "index"})
  get("/users/:user_id", { :controller => "users", :action => "details"})
  get("/add_user", { :controller => "users", :action => "add_user"})
  get("/update_user/:modify_id", { :controller => "users", :action => "update"})

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:photo_id", { :controller => "photos", :action => "details"})
  get("/delete_photo/:photo_id", { :controller => "photos", :action => "destroy"})
  get("/insert_photo", { :controller => "photos", :action => "create"})
  get("/update_photo/:modify_id", { :controller => "photos", :action => "update"})
  get("/add_comment", { :controller => "photos", :action => "new_comment"})
end
