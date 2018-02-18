module ResultHandler
  def define_model_form(result)
    @model = result[:model]
    @form = result['contract.default']
  end
end
