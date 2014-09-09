class Exchange < ActiveRecord::Base
  fields do
  	receptor :string
    picture :string
    level :integer
    timestamps
  end

  attr_accessible :receptor, :picture, :level
end
