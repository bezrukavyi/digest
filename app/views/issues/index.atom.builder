atom_feed do |feed|
  feed.title @mailing_list.name
  feed.updated @issues.maximum(:release_at)

  @issues.each do |issue|
    feed.entry(issue, url: mailing_list_issue_url(@mailing_list, issue)) do |entry|
      entry.title @mailing_list.name + ": " + issue.release_number
      entry.content render('issues/issue.html.haml', mailing_list: @mailing_list, issue: issue), type: 'html'
      entry.url mailing_list_issue_url(issue)
      entry.summary issue.name
      entry.link mailing_list_issue_url(@mailing_list, issue)
    end
  end
end
