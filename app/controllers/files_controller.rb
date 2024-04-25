## CONTROLADOR DE ARCHIVOS ###
# Controlador que se encarga de la gestión de archivos en el servidor

require 'json'

class FilesController < ApplicationController

    def process_file  # metodo para crear archivos de la ruta:http://localhost:3000/files/createfile
        client = Savon.client(wsdl: "http://172.171.240.20:8000/files/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= params[:token] # Token de autenticación del usuario, obtenido en el login, parametro obternido del body  tipo form-data de la petición
        fileName= params[:fileName] # Nombre del archivo, parametro obtenido del body de la petición
        fileSize= params[:fileSize] # Tamaño del archivo, parametro obtenido del body de la petición
        file= params[:file] # Archivo, parametro obtenido del body de la petición Form-data
        folderParent= params[:folderParent] # Carpeta padre, parametro obtenido del body de la petición
        puts client.operations
        response = client.call(:process_file,message: # Llamada SOAP para crear un archivo en el servidor http://172.171.240.20:8000, con el token, el nombre del archivo, el tamaño del archivo, el archivo y la carpeta padre
            {
                "token" => token,  # Token de autenticación del usuario
                "fileName" => fileName,  # Nombre del archivo
                "fileSize" => fileSize,  # Tamaño del archivo
                "file" => file,  # Archivo
                "folderParent" => folderParent  # Carpeta padre
            }) #
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json # Respuesta pasada al formato JSON de la petición al servidor http://172.171.240.20:8000
    end

    def update_file  # metodo para actualizar archivos de la ruta:http://localhost:3000/files/updatefile
        client = Savon.client(wsdl: "http://172.171.240.20:8000/files/soap/?wsdl")  # Consumir un servicio en formato SOAP, instanciando el cliente con la libreria Savon
        token= params[:token] # Token de autenticación del usuario, obtenido en el login, parametro obternido del body de la petición
        fileId= params[:fileId] # Id del archivo, parametro obtenido del body de la petición
        fileName= params[:fileName] # Nombre del archivo, parametro obtenido del body de la petición
        folderParent= params[:folderParent] # Carpeta padre, parametro obtenido del body de la petición
        response = client.call(:update_file,message: { # Llamada SOAP para crear un archivo en el servidor http://172.171.240.20:8000, con el token, el nombre del archivo, el tamaño del archivo, el archivo y la carpeta padre
            "token" => token,  # Token de autenticación del usuario
            "fileId" => fileId,  # Id del archivo
            "fileName" => fileName,  # Nombre del archivo
            "folderParent" => folderParent  # Carpeta padre
        })

        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json # Respuesta pasada al formato JSON de la petición al servidor http://172.171.240.20:8000
    end

    def delete_file  # metodo para eliminar archivos de la ruta:http://localhost:3000/files/deletefile
        client = Savon.client(wsdl: "http://172.171.240.20:8000/files/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= params[:token]  # Token de autenticación del usuario, obtenido en el login, parametro obternido del body de la petición
        fileId= params[:fileId]  # Id del archivo, parametro obtenido del body de la petición
        response = client.call(:delete_file,message: {  # Llamada SOAP para crear un archivo en el servidor http://172.171.240.20:8000, con el token, el nombre del archivo, el tamaño del archivo, el archivo y la carpeta padre
            "token" => token,  # Token de autenticación del usuario
            "fileId" => fileId  # Id del archivo
        })
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json # Respuesta pasada al formato JSON de la petición al servidor http://172.171.240.20:8000
    end

    def share_file  # metodo para compartir archivos de la ruta:http://localhost:3000/files/sharefile
        client = Savon.client(wsdl: "http://172.171.240.20:8000/files/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= params[:token]  # Token de autenticación del usuario, obtenido en el login, parametro obternido del body de la petición
        fileId= params[:fileId]  # Id del archivo, parametro obtenido del body de la petición
        user= params[:user]      # Id del usuario, parametro obtenido del body de la petición
        response = client.call(:share_file,message: {   # Llamada SOAP para crear un archivo en el servidor http://172.171.240.20:8000, con el token, el nombre del archivo, el tamaño del archivo, el archivo y la carpeta padre
            "token" => token,  # Token de autenticación del usuario
            "fileId" => fileId,  # Id del archivo
            "userShare" => user  # Id del usuario
        })
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json     # Respuesta pasada al formato JSON de la petición al servidor http://172.171.240.20:8000
    end
    # download_file

    def download_file  # metodo para descargar archivos de la ruta:http://localhost:3000/files/downloadfile
        client = Savon.client(wsdl: "http://172.171.240.20:8000/files/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= params[:token]  # Token de autenticación del usuario, obtenido en el login, parametro obternido del body de la petición
        fileId= params[:fileId]  # Id del archivo, parametro obtenido del body de la petición
        response = client.call(:download_file,message: {  # Llamada SOAP para crear un archivo en el servidor http://172.171.240.20:8000, con el token, el nombre del archivo, el tamaño del archivo, el archivo y la carpeta padre
            "token" => token,  # Token de autenticación del usuario
            "fileId" => fileId  # Id del archivo
        })
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json     # Respuesta pasada al formato JSON de la petición al servidor http://172.171.240.20:8000
    end

end
