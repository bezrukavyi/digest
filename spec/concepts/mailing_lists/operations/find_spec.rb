describe MailingLists::Find, type: :operation do
  let!(:mailing_list) { build :mailing_list, :by_operation }

  describe '.call' do
    it 'exist' do
      subject = described_class.call(params: {}, id: mailing_list.id)
      expect(subject[:model]).not_to be_nil
      expect(subject).to be_success
    end

    it 'not exist' do
      subject = described_class.call(params: {}, id: 100)
      expect(subject[:model]).to be_nil
      expect(subject).to be_failure
    end
  end
end
