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

  attr_accessible :level, :pick, :reach, :drop, :card_id, :user_id, :receiver_id

  def self.each_by_month &block
    all.group_by { |exchange| exchange.date.beginning_of_month }.each(&block)
  end

  def self.each_by_receiver_name &block
    joins(:receiver).group("receivers.name").select("receivers.name as reciever_name, COUNT(exchanges.id) as count").all.each(&block)
  end

  def self.each_by_user_name &block
    joins(:user).group("users.name").select("users.name as user_name, COUNT(exchanges.id) as count").all.each(&block)
  end
end
