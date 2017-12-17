class ReleaseJob
  include SuckerPunch::Job

  def perform
    ReleaseService.call
  end
end
