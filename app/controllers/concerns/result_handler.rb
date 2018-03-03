module ResultHandler
  private

  def respond_to_result
    raise ArgumentError unless @result

    send("#{action_name}_variables")

    result_match.call(@result) do |on|
      on.failure(:unauthorized) { redirect_to unauthorized_path }
      on.failure(:not_found) { redirect_to not_found_path }
      if block_given?
        yield(on)
      else
        on.success { render action_name }
      end
    end
  end

  def define_form
    @form = @result['contract.default']
  end

  def define_model
    @model = @result[:model]
  end

  def define_collection
    @collection = @result[:model]
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
    define_collection
  end
end
