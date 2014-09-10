class SeedsFactory
  attr_reader :current_instance

  def initialize klass, key = nil
    @klass = klass
    @search_key = key
  end

  def build_multiple attrs_array
    attrs_array.each do |attributes|
      build attributes
    end
  end

  def build attributes
    self.current_instance = search_hash attributes

    attributes.each do |key, value|
      assign_attribute key, value
    end

    current_instance.save!
  end

  def search_hash attributes
    hsh = {}
    if @search_key
      hsh[@search_key] = attributes[@search_key]
    elsif attributes.has_key?(:locales)
      hsh = { name: attributes[:locales][I18n.locale] }
    elsif !attributes[:code].nil?
      hsh = { code: attributes[:code] }
    else
      hsh = { name: attributes[attributes.keys.first] }
    end
    hsh
  end

  def current_instance= hsh
    key = hsh.keys.first
    @current_instance = get_instance_by hsh[key], key
  end

  def get_instance_by val, key
    @klass.send("find_by_#{key}", val) || @klass.new
  end

  def assign_attribute key, value
    if key == :locales
      assign_locales value
    else
      current_instance.send("#{key}=", value)
    end
  end

  def assign_locales locales
    locales.each do |locale, translation|
      I18n.locale = locale
      current_instance.name = translation
    end
  end
end