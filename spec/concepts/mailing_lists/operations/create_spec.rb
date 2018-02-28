describe MailingLists::Create, type: :operation do
  let!(:user) { build :user, :by_operation }

  describe '.call' do
    it 'valid attributes' do
      subject = described_class.call(params: attributes_for(:mailing_list), current_user: user)
      expect(subject[:model]).to be_persisted
      expect(subject['contract.default'].errors.full_messages).to be_blank
    end

    it 'invalid attributes' do
      subject = described_class.call(params: attributes_for(:mailing_list, :invalid), current_user: user)
      expect(subject[:model]).not_to be_persisted
      expect(subject['contract.default'].errors.full_messages).not_to be_blank
    end

    it 'not authorized' do
      subject = described_class.call(params: attributes_for(:mailing_list))
      expect(subject[:model]).not_to be_persisted
      expect(subject['result.policy.default']).to be_failure
    end
  end
end
