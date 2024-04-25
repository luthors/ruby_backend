Rails.application.routes.draw do

  #### SOAP API ####
  # Aqui se definen las rutas para el API SOAP

  post '/login', to: 'logins#login'  # Ruta Login en formato JSON para hacer login en el sistema ruta:http://localhost:3000/login
  post '/loginsoap', to: 'logins#login_soap'  # Ruta Login en formato SOAP para hacer login en el sistema ruta:http://localhost:3000/loginsoap
  post '/register', to: 'logins#register_soap'  # Ruta Registro en formato SOAP para hacer registro en el sistema ruta:http://localhost:3000/register

  post '/folders/registerfoldersoap', to: 'folders#register_folder_soap' # Ruta para registrar carpetas ruta:http://localhost:3000/folders/registerfoldersoap
  get '/folders', to: 'folders#list_folder' # Ruta para obtener listado general de las carpetas ruta:http://localhost:3000/folders
  get '/folders/get_folders_by_parent_id', to: 'folders#get_folders_by_parent_id' # Ruta para obtener listado de carpetas por PARENT ID ruta:http://localhost:3000/folders/get_folders_by_parent_id
  put '/folders/update_folder_soap', to: 'folders#update_folder_soap' # Ruta para actualizar carpetas ruta:http://localhost:3000/folders/update_folder_soap
  put '/folders/share_folder_soap', to: 'folders#share_folder_soap' # Ruta para compartir carpetas ruta:http://localhost:3000/folders/share_folder_soap
  delete '/folders/delete_folder_soap', to: 'folders#delete_folder_soap' # Ruta para eliminar carpetas ruta:http://localhost:3000/folders/delete_folder_soap

  post '/files/createfile' => 'files#process_file' # Ruta para crear archivos ruta:http://localhost:3000/files/createfile
  put '/files/updatefile' => 'files#update_file' # Ruta para actualizar archivos ruta:http://localhost:3000/files/updatefile
  # share_file
  put '/files/sharefile' => 'files#share_file' # Ruta para compartir archivos ruta:http://localhost:3000/files/sharefile
  # delete_file
  delete '/files/deletefile' => 'files#delete_file' # Ruta para eliminar archivos ruta:http://localhost:3000/files/deletefile
  # download_file
  post '/files/downloadfile' => 'files#download_file' # Ruta para descargar archivos ruta:http://localhost:3000/files/downloadfile

end
