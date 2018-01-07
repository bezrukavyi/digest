if Rails.env.development?
  10.times do
    mailing_list = MailingList.create(
      name: FFaker::Book.title,
      description: FFaker::Book.description,
      slug: FFaker::InternetSE.domain_word
    )

    10.times do
      issue = Issue.create(
        mailing_list: mailing_list,
        release_at: Time.zone.now,
        published: true,
        name: FFaker::Lorem.sentence
      )

      10.times do
        IssueItem.create(
          issue: issue,
          source: FFaker::Name.name,
          link: FFaker::Internet.http_url,
          title:  FFaker::Lorem.sentence,
          description: FFaker::Lorem.sentence
        )
      end

      3.times do
        subtitle = Subtitle.create(
          name: FFaker::Book.title,
          issue: issue
        )

        3.times do
          IssueItem.create(
            issue: issue,
            subtitle: subtitle,
            source: FFaker::Name.name,
            link: FFaker::Internet.http_url,
            title:  FFaker::Lorem.sentence,
            description: FFaker::Lorem.sentence
          )
        end
      end
    end
  end
end
