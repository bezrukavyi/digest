module ResultHandler
  private

  def result_matcher(result)
    ResultMatcher.call(result) { |on| yield(on) }
  end

  def respond_to_result(options = {})
    raise ArgumentError unless @result

    ResultMatcher.call(@result) do |on|
      on.failure(:unauthorized) { head :unauthorized }
      on.failure(:not_found) { head :not_found }
      yield(on) if block_given?
      on.failure { respond_to_failure(options) }
      on.success { respond_to_success(options) }
    end
  end

  def respond_to_failure(options)
    contract = options[:contract] || 'contract.default'
    render json: { errors: @result[contract].errors }, status: 422
  end

  def respond_to_success(options)
    entity = @result[:model]
    serializer = options.delete(:serializer)
    presenter = serializer ? serializer.new(entity, options).serialized_json : entity
    respond_with presenter
  end
end
