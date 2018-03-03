module ResultMatcher
  CASES = %i[success failure].freeze

  private

  def result_match
    dry_cases = CASES.each_with_object({}) do |one_case, case_list|
      case_list[one_case] = send("#{one_case}_case")
    end

    Dry::Matcher.new(dry_cases)
  end

  def success_case
    Dry::Matcher::Case.new(
      match:   ->(result) { result.success? && !result['result.contract.default']&.failure? },
      resolve: ->(result) { result }
    )
  end

  def failure_case
    Dry::Matcher::Case.new(
      match:   ->(result, *patterns) { patterns.any? ? case_patterns(result, patterns) : result.failure? },
      resolve: ->(result) { result }
    )
  end

  def case_patterns(result, patterns)
    patterns.any? { |pattern| send("#{pattern}_pattern", result) }
  end

  def invalid_pattern(result)
    contracts = result.inspect.scan(/result.contract.\w+/)
    contracts.any? do |name|
      contract = result[name]
      result.failure? && contract && contract.failure?
    end
  end

  def unauthorized_pattern(result)
    policies = result.inspect.scan(/result.policy.\w+/)
    policies.any? do |name|
      policy = result[name]
      result.failure? && policy && policy.failure?
    end
  end

  def not_found_pattern(result)
    model = result[:model]
    result.failure? && model.nil?
  end
end
