class User < ActiveRecord::Base
  fields do
    name :string
    last_name :string
    birthdate :datetime
    remote_id :string
  end

  attr_accessible :name, :last_name, :birthdate, :remote_id
end
