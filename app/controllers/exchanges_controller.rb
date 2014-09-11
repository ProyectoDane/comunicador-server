class ExchangesController < ApplicationController
  # GET /exchanges
  # GET /exchanges.json
  def index
    @exchanges = Exchange.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exchanges }
    end
  end

  # POST /exchanges
  # POST /exchanges.json
  def create
    raise 'No data received' if params[:data].nil?

    remote_object = JSON.parse(params[:data])

    unless remote_object.empty?
      user_params = remote_object[:user]
      receiver_params = remote_object[:receiver]
      registry_params = remote_object[:registry]

      user = User.find_or_create_by(remote_id: user_params[:id], name: user_params[:name]) do |new_user|
        user.last_name = user_params[:last_lame]
        user.birthdate = user_params[:birthdate]
      end

      card = Card.find_or_create_by(remote_object[:card])
      
      receiver = Receiver.find_or_create_by(remote_id: receiver_params[:id], name: receiver_params[:name]) do |new_receiver|
        receiver.last_name = receiver_params[:last_name]
        receiver.relationship = receiver_params[:relationship] # Another model?
      end

      Exchange.create({
        card_id: card.id,
        user_id: user.id,
        receiver_id: receiver.id,
        pick:  registry_params[:pick],
        reach: registry_params[:reach],
        drop:  registry_params[:drop],
        date:  DateTime.now, # RODO: Parse this
        level: remote_object[:level]
      })
    end

    respond_to do |format|
      begin
        PrivatePub.publish_to '/exchanges/new', some_data: 2
      rescue Exception
        raise "Faye is offline!!"
      end

      format.json { render json: { success: true }, status: :created }
    end
  end
end
