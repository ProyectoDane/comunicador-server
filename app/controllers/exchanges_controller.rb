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
    remote_object = RemoteObject.new(params[:data])

    if remote_object.correct?
      user_params = remote_object['user']
      receiver_params = remote_object['receiver']
      registry_params = remote_object['registry']

      user = User.find_or_create_by(remote_id: user_params['id'], name: user_params['name']) do |new_user|
        new_user.last_name = user_params['last_lame']
        new_user.birthdate = parse_date(user_params['birthdate'])
      end

      card = Card.find_or_create_by(remote_object['card'])
      
      receiver = Receiver.find_or_create_by(remote_id: receiver_params['id'], name: receiver_params['name']) do |new_receiver|
        new_receiver.last_name = receiver_params['last_name']
        new_receiver.relationship = receiver_params['relationship']
      end

      exchange = Exchange.create({
        card_id: card.id,
        user_id: user.id,
        receiver_id: receiver.id,
        pick:  registry_params['pick'],
        reach: registry_params['reach'],
        drop:  registry_params['drop'],
        date:  parse_date(remote_object['date']),
        level: remote_object['level']
      })
    end

    respond_to do |format|
      if remote_object.correct?
        begin
          PrivatePub.publish_to '/exchanges/new',
            exchangeHTML: exchange ? render_to_string(exchange) : "",
            users_count: User.count,
            cards_count: Card.count,
            exchanges_count: Exchange.count,
            receivers_count: Receiver.count
        rescue Exception
          puts 'Warning:'
          puts "\tFaye is offline!! We cannot send realtime notifications to the server at this time."
        end

        format.json { render json: { exchange: @exchange.to_json, success: true }, status: :created }
      else
        format.json { render json: { success: false }, status: :unprocessable_entity }
      end
    end
  end


  def by_month
    response = Exchange.by_month.map do |date, exchanges|
      { period: date.strftime('%Y-%m'), exchanges: exchanges.count }
    end

    respond_to do |format|
      format.json { render json: response }
    end
  end

  def by_receiver_name
    response = Exchange.by_receiver_name.map do |exchange|
      { label: exchange.reciever_name, value: exchange.count }
    end

    respond_to do |format|
      format.json { render json: response }
    end
  end

  def by_user_name
    response = Exchange.by_user_name.map do |exchange|
      { user_name: exchange.user_name, exchanges: exchange.count }
    end

    respond_to do |format|
      format.json { render json: response }
    end
  end

  private
    def parse_date date
      begin
        DateTime.parse(date) unless date.nil?
      rescue ArgumentError
        nil
      end
    end
end