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
    contract = result['result.contract.default']
    result.failure? && contract && contract.failure?
  end

  def unauthorized_pattern(result)
    policy = result['result.policy.default']
    result.failure? && policy && policy.failure?
  end

  def not_found_pattern(result)
    model = result[:model]
    result.failure? && model.nil?
  end
end
