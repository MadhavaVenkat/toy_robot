class RobotsController < ApplicationController
  
  def report
    @params = params[:command]
    @intial_commands = @params

    @commands = []
    unless @params.nil?
      @commands = @params.split(',') 
      @place = true if @commands.first =~ /Place/i
      @x = @commands.shift.gsub(/\[/,"").split(" ")[1].to_i
      @y = @commands.shift.to_i
      @f = @commands.shift
    end

    @cmds = []
    @commands.each do |cmd|
      @cmds << cmd.gsub(/\]/,"")
    end 
    
    if @place
      if @x > 5 or @y > 5
        falling_robot
      else
        to_set_robot unless @cmds.empty?
      end
    else
      @placing_robot = "Please Place a Order (Example: ?command=[PLACE 0,0,EAST,MOVE,MOVE,LEFT,MOVE,REPORT])"
    end
  end  

  def to_set_robot
    @f = @f.upcase.strip
    @cmds.each do |cm|
      cm = cm.upcase.strip
      
      case cm
      when "MOVE"
        set_move
      when "LEFT"
        to_move_left
      when "RIGHT"
        to_move_right
      when "REPORT"
        @report = "Out put Result:#{@x},#{@y},#{@f}"
      else
        exit
      end

    end
  end

  def set_move
    case @f
    when "EAST"
      if @x <= 5
        @x = @x + 1 
      else
        falling_robot
      end
    when "NORTH"
      if @y <= 5
        @y = @y + 1 
      else
        falling_robot
      end
    when "SOUTH"
      @y = @y - 1 unless @y = 0
    when "WEST"
      @x = @x - 1 unless @x = 0  
    else
      exit
    end
  end

  def to_move_left
    case @f
    when "EAST"
      @f = "NORTH"
    when "NORTH"
      @f = "WEST"
    when "SOUTH"
      @f = "EAST"
    when "WEST"
      @f = "SOUTH" 
    else
      exit
    end

  end

  def to_move_right
    case @f
    when "EAST"
      @f = "SOUTH"
    when "NORTH"
      @f = "EAST"
    when "SOUTH"
      @f = "WEST"
    when "WEST"
      @f = "NORTH" 
    else
      exit
    end

  end
  
  private 

  def falling_robot
    @robot_falling = "Robot is about to falling! please change the Place Values(x,y values not more than 6)"
  end
end


 
