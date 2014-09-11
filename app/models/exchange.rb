class Exchange < ActiveRecord::Base
  fields do
    level :integer
    pick 	:string
    reach :string
    drop  :string
    date 	:datetime
  end

  belongs_to :card
  belongs_to :user
  belongs_to :receiver

  attr_accessible :level, :pick, :reach, :drop, :date, :card_id, :user_id, :receiver_id

  def self.by_month &block
    all.group_by { |exchange| exchange.date.beginning_of_month }
  end

  def self.by_receiver_name &block
    joins(:receiver).group("receivers.name").select("receivers.name as reciever_name, COUNT(exchanges.id) as count").all
  end

  def self.by_user_name &block
    joins(:user).group("users.name").select("users.name as user_name, COUNT(exchanges.id) as count").all
  end
end
