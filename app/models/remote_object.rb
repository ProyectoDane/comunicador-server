class RemoteObject
  attr_accessor :data

  def initialize data
    begin
      @data = JSON.parse(data)    
    rescue JSON::ParserError => e
      raise "The sent JSON doesn't have the correct format.\nSent data: #{data}.\nException: #{e}."
    rescue TypeError => e
      raise "No data received or the data is incomplete.\nSent data: #{data}.\nException: #{e}."
    end
  end

  def correct?
    @data && !@data.empty? && has_user? 
  end

  def [] key
    @data[key]
  end

  def has_user?
    user = self['user']
    !user['name'].blank? && !user['last_name'].blank?
  end
end
