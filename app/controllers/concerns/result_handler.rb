module ResultHandler
  private

  def respond_to_result
    raise ArgumentError unless @result

    send("#{action_name}_variables")

    result_match.call(@result) do |on|
      on.failure(:unauthorized) { head :unauthorized }
      on.failure(:not_found) { head :not_found }
      yield(on) if block_given?
      on.failure { respond_to_error }
      on.success { respond_to_model }
    end
  end

  def define_form
    @form = @result['contract.default']
  end

  def define_model
    @model = @result[:model]
  end

  def show_variables
    define_model
  end

  def destroy_variables
    define_model
  end

  def edit_variables
    define_model
    define_form
  end

  def new_variables
    define_model
    define_form
  end

  def update_variables
    define_model
    define_form
  end

  def create_variables
    define_model
    define_form
  end

  def index_variables
    define_model
  end

  def respond_to_error
    render json: @model, status: 422, serializer: ActiveModel::Serializer::ErrorSerializer.new(@model, @form)
  end

  def respond_to_model
    respond_with @model
  end
end
