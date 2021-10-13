class WelcomeController < ApplicationController 
    def index
        cookies.encrypted[:favorite_cookie] = 'chocolate chips'
    end 
end     