module IssuesHelper
  def next_issue(issue)
    return unless issue.next
    link_to 'Next »', issue_path(issue.next)
  end

  def prev_issue(issue)
    return unless issue.prev
    link_to '« Prev', issue_path(issue.prev)
  end

  def issue_release_path(issue)
    link_to t('issues.release', release: issue.release_number), issue_path(issue)
  end

  def issue_path(issue)
    mailing_list_issue_path(issue.mailing_list, issue.release_number)
  end

  def issues_active_class(issue, current_issue)
    return unless current_issue
    issue.id == current_issue.id ? 'active' : ''
  end
end
