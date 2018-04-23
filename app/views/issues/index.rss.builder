xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0' do
  xml.channel do
    xml.title @mailing_list.name
    xml.description @mailing_list.description
    xml.link api_v1_mailing_list_url(@mailing_list)

    @issues.each do |issue|
      xml.item do
        xml.title "#{@mailing_list.name}: #{issue.release_number} #{issue.name}"
        xml.description render('issues/issue.html.haml', mailing_list: @mailing_list, issue: issue)
        xml.pubDate issue.release_at.to_s(:rfc822)
        xml.link api_v1_mailing_list_issue_url(@mailing_list, issue)
        xml.guid api_v1_mailing_list_issue_url(@mailing_list, issue)
      end
    end
  end
end
