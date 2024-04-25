require 'json'

class FoldersController < ApplicationController
    def list_folder
        client = Savon.client(wsdl: "http://172.171.240.20:8000/server/soap/?wsdl")  # Consumir un servicio en formato SOAP
        response = client.call(:list)
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json
    end

    def get_folders_by_parent_id
        client = Savon.client(wsdl: "http://172.171.240.20:8000/server/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= params[:token]
        parentFolder = params[:parentFolder]
        response = client.call(:get_folders_by_parent_id,message: {"token" => token, "parentFolder" => parentFolder})
        # response = client.request :web, :get_folders_by_parent_id, body: {token => token}
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json
    end

    def update_folder_soap
        client = Savon.client(wsdl: "http://172.171.240.20:8000/server/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= params[:token]
        parentFolder = params[:parentFolder]
        folderId= params[:folderId]
        folderName= params[:folderName]
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
        client = Savon.client(wsdl: "http://172.171.240.20:8000/server/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= params[:token]
        folderId= params[:folderId]
        user= params[:user]
        response = client.call(:share_folder_soap,message:
            {
                "token" => token,
                "folderId" => folderId,
                "user" => user,
            })
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json
    end
    def delete_folder_soap
        client = Savon.client(wsdl: "http://172.171.240.20:8000/server/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= params[:token]
        folderId= params[:folderId]
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



    def register_folder_soap
        client = Savon.client(wsdl: "http://172.171.240.20:8000/server/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= params[:token]
        parentFolder = params[:parentFolder]
        folderName= params[:folderName]
        response = client.call(:register_folder_soap,message:
            {
                "token" => token,
                "folderName" => folderName,
                "parentFolder" => parentFolder
            })
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json
    end
end
