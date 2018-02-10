class ReleaseService
  def self.call
    issues = Issue.awaiting

    issues.each do |issue|
      issue.update(published: true)
      issue.mailing_list.subscriptions.active.each do |subscription|
        DeliveryJob.perform_async(issue.id, subscription.id)
      end
    end
  end
end
