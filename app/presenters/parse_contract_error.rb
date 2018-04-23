class ParseContractError < Operators::Service
  attr_reader :form, :nested_forms

  def initialize(form)
    @form = form
    @nested_forms = extract_nested_forms
  end

  def call
    errors = {}

    errors.merge!(form_erros)
    errors.merge!(extract_nested_errors)

    errors
  end

  private

  def form_erros
    form.errors.messages.reject { |key, _| key.match(/\./) }
  end

  def extract_nested_forms
    result = {}

    form.schema.map do |attribute|
      options = attribute.instance_variable_get('@options')
      name = options[:name].to_sym
      next unless options[:nested]
      result[name] ||= []
      result[name] += form.send(options[:name])
    end

    result
  end

  def extract_nested_errors
    errors = {}
    nested_forms.each do |name, forms|
      errors[name] = forms.map { |form| self.class.call(form) }
    end
    errors
  end

  def fetch_errors(forms)
    errors_forms = forms.reject { |nested_form| nested_form.errors.empty? }
    errors_forms.map(&:errors).map(&:messages)
  end
end
