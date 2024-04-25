
require 'json'

class LoginsController < ApplicationController
    def login
        puts params
        response = HTTParty.post('http://172.171.240.20:8000/users/login2/', body: {username: params[:username], password: params[:password]}.to_json, headers: { 'Content-Type' => 'application/json' })
        puts response.body
        return render :json => response.to_json
    end
    def login_soap
        client = Savon.client(wsdl: "http://172.171.240.20:8000/users/soap/?wsdl")  # Consumir un servicio en formato SOAP
        username= params[:username]
        password= params[:password]
        print("===================OPEARTIONS=========================== \n")
        puts client.operations
        response = client.call(:login_soap,message:
            {
                "username" => username,
                "password" => password
            })
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json
    end

    def register_soap
        client = Savon.client(wsdl: "http://172.171.240.20:8000/users/soap/?wsdl")  # Consumir un servicio en formato SOAP
        username= params[:username]
        name= params[:name]
        email= params[:email]
        #phone = params[:phone]
        password= params[:password]
        age = params[:age]
        puts params
        puts client.operations
        response = client.call(:resgister_soap, message: 
            {
                "username" => username,
                "name" => name,
                "email" => email,
                "age"=> age,
                #"phone" => phone,
                "password" => password
            })
        print("===================XML=========================== \n")
        puts response
        print("===================JSON=========================== \n")
        puts (response).to_json
        return render :json => response.to_json
    end

end
