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
    # @interactions = Interaction.create(params[:interactions])
    @interaction = Interaction.create(receptor: "Some guy", picture: "Some picture")

    respond_to do |format|
      if true # @interactions.save
        PrivatePub.publish_to '/interactions/new', interaction: @interaction.to_json

        format.json { render json: @interaction, status: :created, location: @interaction }
      else
        format.json { render json: @interaction.errors, status: :unprocessable_entity }
      end
    end
  end
end
