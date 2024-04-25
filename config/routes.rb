Rails.application.routes.draw do
  post '/login', to: 'logins#login'
  post '/loginsoap', to: 'logins#login_soap'
  post '/register', to: 'logins#register_soap'

  post '/folders/registerfoldersoap', to: 'folders#register_folder_soap'
  get '/folders', to: 'folders#list_folder'
  get '/folders/get_folders_by_parent_id', to: 'folders#get_folders_by_parent_id'
  put '/folders/update_folder_soap', to: 'folders#update_folder_soap'
  put '/folders/share_folder_soap', to: 'folders#share_folder_soap'
  delete '/folders/delete_folder_soap', to: 'folders#delete_folder_soap'

  post '/files/createfile' => 'files#process_file'
  put '/files/updatefile' => 'files#update_file'
  # share_file
  put '/files/sharefile' => 'files#share_file'
  # delete_file
  delete '/files/deletefile' => 'files#delete_file'
  # download_file
  get '/files/downloadfile' => 'files#download_file'
  



end
