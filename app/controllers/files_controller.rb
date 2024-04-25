require 'json'

class FilesController < ApplicationController

    def process_file
        client = Savon.client(wsdl: "http://172.171.240.20:8000/files/soap/?wsdl")  # Consumir un servicio en formato SOAP
        token= params[:token]
        fileName= params[:fileName]
        fileSize= params[:fileSize]
        file= params[:file]
        folderParent= params[:folderParent]
        puts client.operations
        response = client.call(:process_file,message:
            {
                "token" => token,
                "fileName" => fileName,
                "fileSize" => fileSize,
                "file" => file,
                "folderParent" => folderParent
            })
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json
    end

    def update_file
        

end
