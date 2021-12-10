require 'rails_helper'

RSpec.describe RobotsController, type: :routing do
  describe "routing" do
    it "routes to #report" do 
      expect(get: "api/robot/0/orders").to route_to("robots#report")
    end

    it "routes to #report with parameters" do 
        expect(get: "api/robot/0/orders",params:{command: "[PLACE 0,0,EAST,MOVE,MOVE,LEFT,MOVE,REPORT]"}).to route_to("robots#report")
    end
  end
end