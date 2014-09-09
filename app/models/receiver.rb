class Receiver < ActiveRecord::Base
  fields do
    remote_id    :integer
    name         :string
    last_name    :string
    relationship :string
  end

  attr_accessible :remote_id, :name, :last_name, :relationship
end
