class InteractionsController < ApplicationController
  # GET /interactions
  # GET /interactions.json
  def index
    @interactions = Interaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @interactions }
    end
  end

  # POST /interactions
  # POST /interactions.json
  def create
    raise 'No data received' if params[:data].nil?

    remote_object = JSON.parse(params[:data])

    User.find_or_create_by(remote_id: remote_object[:userId], name: remote_object[:userName]) do |user|
      user.last_name = remote_object[:userLastName]
      user.birthdate = remote_object[:userBirthdate]
    end

    Card.find_or_create_by(name: remote_object[:cardName])
    
    Receiver.find_or_create_by(name: remote_object[:receiverName]) do |receiver|
      receiver.last_name = remote_object[:receiverLastName]
      receiver.relationship = remote_object[:relationship] # Another model?
    end

    Interaction.create({
      #card_id: card.id
      #user_id: user.id
      #receiver_id: receiver.id
      level: remote_object[:level]
    })

    respond_to do |format|
      if true #@interaction.save
        PrivatePub.publish_to '/interactions/new', some_data: 2

        format.json { render json: { success: true }, status: :created }
      else
        format.json { render json: { errors: "something bad happened" }, status: :unprocessable_entity }
      end
    end
  end
end
