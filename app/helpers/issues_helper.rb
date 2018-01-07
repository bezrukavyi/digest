module IssuesHelper
  def next_issue(issue)
    return unless issue.next
    link_to 'Next »', issue_path(issue.next)
  end

  def prev_issue(issue)
    return unless issue.prev
    link_to '« Prev', issue_path(issue.prev)
  end

  def issue_path(issue)
    mailing_list_issue_path(issue.mailing_list, issue.release_number)
  end
end
