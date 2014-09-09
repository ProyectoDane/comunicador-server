class Exchange < ActiveRecord::Base
  fields do
    level :integer
    pick 	:string
    reach :string
    drop 	:string
    timestamps
  end

  belongs_to :card
  belongs_to :user
  belongs_to :receiver

  attr_accessible :level, :pick, :reach, :drop, :card_id, :user_id, :receiver_id
end
