module CustomQuerying
  # Monkey patch Rails 4 methods

  def find_or_create_by(attributes, &block)
    find_by(attributes) || create(attributes, &block)
  end

  def find_or_create_by!(attributes, &block)
    find_by(attributes) || create!(attributes, &block)
  end

  def find_by(*args)
    where(*args).first
  end

  def find_by!(*args)
    where(*args).first!
  end
end

ActiveRecord::Base.extend CustomQuerying