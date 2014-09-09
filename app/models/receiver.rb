class Receiver < ActiveRecord::Base
  fields do
    name         :string
    last_name    :string
    relationship :string
  end

  attr_accessible :name, :last_name, :relationship
end
