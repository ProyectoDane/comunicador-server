class Interaction < ActiveRecord::Base
  fields do
    receptor :string
    picture :string
    level :integer
    timestamps
  end
  
  attr_accessible :receptor, :picture
end
