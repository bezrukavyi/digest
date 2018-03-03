class UniqueValidator < ActiveModel::EachValidator
  def validate_each(form, attribute, value)
    model = form.model_for_property(attribute)

    # search for models with attribute equals to form field value
    query = model.class.where(attribute => value)

    # apply scope if options has been declared
    Array(options[:scope]).each do |field|
      # add condition to only check unique value with the same scope
      query = query.where(field => form.send(field))
    end

    # if model persisted, query may return 0 or 1 rows, else 0
    allow_count = model.persisted? ? 1 : 0
    form.errors.add(attribute, :taken) if query.count > allow_count
  end
end
