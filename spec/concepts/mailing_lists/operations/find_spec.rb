describe MailingLists::Find, type: :operation do
  let!(:mailing_list) { build :mailing_list, :by_operation }
  let!(:user) { mailing_list.user }

  describe '.call' do
    it 'exist' do
      subject = described_class.call(params: {}, current_user: user, id: mailing_list.id)
      expect(subject[:model]).not_to be_nil
      expect(subject).to be_success
    end

    it 'not exist' do
      subject = described_class.call(params: {}, current_user: user, id: 100)
      expect(subject[:model]).to be_nil
      expect(subject).to be_failure
    end

    it 'not authorized' do
      subject = described_class.call(params: {}, current_user: nil, id: mailing_list.id)
      expect(subject[:model]).not_to be_nil
      expect(subject['result.policy.default']).to be_failure
      expect(subject).to be_failure
    end
  end
end
