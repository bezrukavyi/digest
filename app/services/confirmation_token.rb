class ConfirmationToken < Operators::Service
  attr_reader :entity, :column_name

  def initialize(entity, column_name = :confirmation_token)
    @entity = entity
    @column_name = column_name
  end

  def call
    loop do
      token = SecureRandom.hex
      entity.send("#{column_name}=", token)
      break token unless entity.class.exists?("#{column_name}": token)
    end
    entity.save ? entity.send(column_name) : nil
  end
end
