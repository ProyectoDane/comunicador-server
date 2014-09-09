class Card < ActiveRecord::Base
  fields do
    name :string
  end

  attr_accessible :name
end
