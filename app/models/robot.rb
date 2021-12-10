class Robot
  include Mongoid::Document
  field :place, type: String
  field :command, type: String
end
