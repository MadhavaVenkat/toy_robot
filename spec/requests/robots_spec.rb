require 'rails_helper'

RSpec.describe "Robots", type: :request do

  describe "GET /index" do
    it "to get robot order" do 
      get "/api/robot/0/orders" , params: {command: "[PLACE 0,0,EAST,MOVE,MOVE,LEFT,MOVE,REPORT]"}
      expect(response).to have_http_status(200)
      expect(response.body).to include("Out put Result")
    end

    it "robot falling" do 
      get "/api/robot/0/orders" , params: {command: "[PLACE 6,6,EAST,MOVE,MOVE,LEFT,MOVE,REPORT]"}
      expect(response).to have_http_status(200)
      expect(response.body).to include("Robot is about to falling!")
    end

    it "placing wrong command" do 
      get "/api/robot/0/orders" , params: {command: "[PLA 0,0,EAST,MOVE,MOVE,LEFT,MOVE,REPORT]"}
      expect(response).to have_http_status(200)
      expect(response.body).to include("Please Place a Order")
    end
  end
  
end




