describe MailingList::Cell, type: :cell do
  controller Dashboard::MailingListsController

  let!(:mailing_list) { build :mailing_list, :by_operation }
  subject { cell(:mailing_list, mailing_list).call(:show) }

  it { expect(subject).to have_tag('p', mailing_list.name) }
  it { expect(subject).to have_tag('p', mailing_list.slug) }
  it { expect(subject).to have_tag('p', mailing_list.description) }
end
