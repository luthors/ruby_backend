require 'json'

class FoldersController < ApplicationController
    def list_folder # metodo para listar las carpetas la ruta:http://localhost:3000/folders/list
        client = Savon.client(wsdl: "http://172.171.240.20:8000/server/soap/?wsdl")  # Consumir un servicio en formato SOAP
        response = client.call(:list) #  Llamada soap para listar todas las carpetas
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json # Respuesta pasada al formato JSON de la petición al servidor http://172.171.240.20:8000
    end

    def get_folders_by_parent_id    # metodo para listar las carpetas de un padre la ruta:http://localhost:3000/folders/getfoldersbyparentid
        client = Savon.client(wsdl: "http://172.171.240.20:8000/server/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= params[:token]          # Token de autenticación del usuario, obtenido en el login, parametro obternido del body de la petición
        parentFolder = params[:parentFolder]  # Id de la carpeta padre, parametro obtenido del body de la petición
        response = client.call(:get_folders_by_parent_id,message: {"token" => token, "parentFolder" => parentFolder})
        # Llamada SOAP para crear un archivo en el servidor http://172.171.240.20:8000, con el token, el nombre del archivo, el tamaño del archivo, el archivo y la carpeta padre
        # response = client.request :web, :get_folders_by_parent_id, body: {token => token}
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json # Respuesta pasada al formato JSON de la petición al servidor http://172.171.240.20:8000
    end

    def update_folder_soap
        client = Savon.client(wsdl: "http://172.171.240.20:8000/server/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= params[:token]   # Token de autenticación del usuario, obtenido en el login, parametro obternido del body de la petición
        parentFolder = params[:parentFolder] # Id de la carpeta padre, parametro obtenido del body de la petición
        folderId= params[:folderId] # Id del archivo, parametro obtenido del body de la petición
        folderName= params[:folderName] # Nombre del archivo, parametro obtenido del body de la petición
        response = client.call(:update_folder_soap,message: # Llamada soap para crear un archivo en el servidor http://172.171.240.20:8000, con el token, el nombre del archivo, el tamaño del archivo, el archivo y la carpeta padre
            {
                "token" => token, # Token de autenticación del usuario
                "folderId" => folderId, # Id del archivo
                "folderName" => folderName, # Nombre del archivo
                "parentFolder" => parentFolder # Carpeta padre
            }) #

        # response = client.request :web, :get_folders_by_parent_id, body: {token => token}
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json # Respuesta pasada al formato JSON de la petición al servidor http://172.171.240.20:8000
    end
    def share_folder_soap # metodo para compartir carpetas de la ruta:http://localhost:3000/folders/sharefolder
        client = Savon.client(wsdl: "http://172.171.240.20:8000/server/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= params[:token] # Token de autenticación del usuario, obtenido en el login, parametro obternido del body de la petición
        folderId= params[:folderId] # Id del archivo, parametro obtenido del body de la petición
        user= params[:user] # Id del usuario, parametro obtenido del body de la petición
        response = client.call(:share_folder_soap,message: # Llamada soap para crear un archivo en el servidor http://172.171.240.20:8000, con el token, el nombre del archivo, el tamaño del archivo, el archivo y la carpeta padre
            {
                "token" => token, # Token de autenticación del usuario
                "folderId" => folderId, # Id del archivo
                "user" => user, # Id del usuario
            })
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json # Respuesta pasada al formato JSON de la petición al servidor http://172.171.240.20:8000
    end
    def delete_folder_soap # metodo para eliminar carpetas de la ruta:http://localhost:3000/folders/deletefolder
        client = Savon.client(wsdl: "http://172.171.240.20:8000/server/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= params[:token] # Token de autenticación del usuario, obtenido en el login, parametro obternido del body de la petición
        folderId= params[:folderId] # Id del archivo, parametro obtenido del body de la petición
        response = client.call(:delete_folder_soap,message: # Llamada soap para crear un archivo en el servidor http://172.171.240.20:8000, con el token, el nombre del archivo, el tamaño del archivo, el archivo y la carpeta padre
            {
                "token" => token, # Token de autenticación del usuario
                "folderId" => folderId, # Id del archivo
            })

        # response = client.request :web, :get_folders_by_parent_id, body: {token => token}
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json # Respuesta pasada al formato JSON de la petición al servidor http://172.171.240.20:8000
    end



    def register_folder_soap # metodo para registrar carpetas de la ruta:http://localhost:3000/folders/registerfolder
        client = Savon.client(wsdl: "http://172.171.240.20:8000/server/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= params[:token] # Token de autenticación del usuario, obtenido en el login, parametro obternido del body de la petición
        parentFolder = params[:parentFolder] #  Id de la carpeta padre, parametro obtenido del body de la petición
        folderName= params[:folderName] # Nombre de la carpeta, parametro obtenido del body de la petición
        response = client.call(:register_folder_soap,message: # Llamada soap para crear un archivo en el servidor http://172.171.240.20:8000, con el token, el nombre del archivo, el tamaño del archivo, el archivo y la carpeta padre
            {
                "token" => token, # Token de autenticación del usuario
                "folderName" => folderName, # Nombre de la carpeta
                "parentFolder" => parentFolder # Id de la carpeta padre
            })
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json # Respuesta pasada al formato JSON de la petición al servidor http://172.171.240.20:8000
    end
end
