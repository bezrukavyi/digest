class BaseOperation < Trailblazer::Operation
  attr_reader :env, :params

  def self.attr_env(name, as: nil)
    as ||= name
    define_method(as) { env[name] }
    define_method("#{as}=") { |value| env[name] = value }
  end

  attr_env :model

  step :initializer

  def initializer(env, params:, **)
    @env = env
    @params = params
  end

  def failure
    Trailblazer::Activity::Left
  end

  def success
    Trailblazer::Activity::Right
  end
end
