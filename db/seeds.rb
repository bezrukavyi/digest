if Rails.env.development?
  admin = User.find_or_initialize_by(email: 'admin@example.com') do |user|
    user.password = 'pass1234'
    user.password_confirmation = user.password
  end

  10.times do
    mailing_list = MailingList.create(
      name: FFaker::Book.title,
      description: FFaker::Book.description,
      slug: FFaker::InternetSE.domain_word,
      user: admin
    )

    10.times do
      issue = Issue.create(
        mailing_list: mailing_list,
        release_at: Time.zone.now,
        published: true,
        name: FFaker::Lorem.sentence
      )

      FactoryBot.create_list(:issue_item, 10, :with_link, issue: issue)

      3.times do
        subtitle = Subtitle.create(
          name: FFaker::Book.title,
          issue: issue
        )

        FactoryBot.create_list(:issue_item, 3, :with_link, subtitle: subtitle, issue: issue)
      end
    end
  end
end
