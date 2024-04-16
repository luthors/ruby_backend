require 'json'

class FoldersController < ApplicationController
    def list_folder
        client = Savon.client(wsdl: "http://localhost:8000/server/soap/?wsdl")  # Consumir un servicio en formato SOAP
        response = client.call(:list)
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json
    end

    def get_folders_by_parent_id
        client = Savon.client(wsdl: "http://localhost:8000/server/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE0NTAzMDI5LCJpYXQiOjE3MTMyMDcwMjksImp0aSI6ImZmZmZiNTJjMzNmMjRjM2Q5YWQwOGRkZTYxODJkMmY3IiwidXNlcl9pZCI6ImFkbWluIn0.gExzohZ7LbLENytW_hW3TVq6OU4pIJe8V6Eo-Enafz8'
        parentFolder = 0
        response = client.call(:get_folders_by_parent_id,message: {"token" => token, "parentFolder" => parentFolder})
        # response = client.request :web, :get_folders_by_parent_id, body: {token => token}
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json
    end

    def update_folder_soap
        client = Savon.client(wsdl: "http://localhost:8000/server/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE0NTAzMDI5LCJpYXQiOjE3MTMyMDcwMjksImp0aSI6ImZmZmZiNTJjMzNmMjRjM2Q5YWQwOGRkZTYxODJkMmY3IiwidXNlcl9pZCI6ImFkbWluIn0.gExzohZ7LbLENytW_hW3TVq6OU4pIJe8V6Eo-Enafz8'
        parentFolder = 0
        folderId=4
        folderName="carpetahijaactulizada"
        response = client.call(:update_folder_soap,message:
            {
                "token" => token,
                "folderId" => folderId,
                "folderName" => folderName,
                "parentFolder" => parentFolder
            })

        # response = client.request :web, :get_folders_by_parent_id, body: {token => token}
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json
    end
    def share_folder_soap
        client = Savon.client(wsdl: "http://localhost:8000/server/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE0NTAzMDI5LCJpYXQiOjE3MTMyMDcwMjksImp0aSI6ImZmZmZiNTJjMzNmMjRjM2Q5YWQwOGRkZTYxODJkMmY3IiwidXNlcl9pZCI6ImFkbWluIn0.gExzohZ7LbLENytW_hW3TVq6OU4pIJe8V6Eo-Enafz8'
        folderId=4
        user="user2"
        response = client.call(:share_folder_soap,message:
            {
                "token" => token,
                "folderId" => folderId,
                "user" => user,
            })

        # response = client.request :web, :get_folders_by_parent_id, body: {token => token}
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json
    end
    def delete_folder_soap
        client = Savon.client(wsdl: "http://localhost:8000/server/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE0NTAzMDI5LCJpYXQiOjE3MTMyMDcwMjksImp0aSI6ImZmZmZiNTJjMzNmMjRjM2Q5YWQwOGRkZTYxODJkMmY3IiwidXNlcl9pZCI6ImFkbWluIn0.gExzohZ7LbLENytW_hW3TVq6OU4pIJe8V6Eo-Enafz8'
        folderId=17
        response = client.call(:delete_folder_soap,message:
            {
                "token" => token,
                "folderId" => folderId,
            })

        # response = client.request :web, :get_folders_by_parent_id, body: {token => token}
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json
    end
end
