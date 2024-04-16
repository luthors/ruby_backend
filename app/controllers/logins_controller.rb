
require 'json'

class LoginsController < ApplicationController
    def login
        puts params
        response = HTTParty.post('http://127.0.0.1:8000/users/login2/', body: {username: params[:username], password: params[:password]}.to_json, headers: { 'Content-Type' => 'application/json' })
        puts response.body

        return render :json => response.to_json
    end
end
