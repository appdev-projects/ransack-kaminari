Rails.application.routes.draw do
  # Routes for the Comment resource:
  root to: "posts#index"

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })

  # UPDATE
  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })

  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Post resource:

  # CREATE
  post("/insert_post", { :controller => "posts", :action => "create" })

  # READ
  get("/posts", { :controller => "posts", :action => "index" })
  get("posts/new", { :controller => "posts", :action => "new" })
  get("posts/:path_id/edit", { :controller => "posts", :action => "edit" })

  get("/posts/:path_id", { :controller => "posts", :action => "show" })

  # UPDATE

  post("/modify_post/:path_id", { :controller => "posts", :action => "update" })

  # DELETE
  get("/delete_post/:path_id", { :controller => "posts", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create" })

  # EDIT PROFILE FORM
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })

  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })

  # SIGN OUT
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })

  #------------------------------

end
