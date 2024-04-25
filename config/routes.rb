Rails.application.routes.draw do
  post '/login', to: 'logins#login'
  post '/loginsoap', to: 'logins#login_soap'
  post '/register', to: 'logins#register_soap'

  get '/folders', to: 'folders#list_folder'
  get '/folders/get_folders_by_parent_id', to: 'folders#get_folders_by_parent_id'
  put '/folders/update_folder_soap', to: 'folders#update_folder_soap'
  put '/folders/share_folder_soap', to: 'folders#share_folder_soap'
  delete '/folders/delete_folder_soap', to: 'folders#delete_folder_soap'

  post '/createfile' => 'files#process_file'
  put '/updatefile' => 'files#update_file'




end
