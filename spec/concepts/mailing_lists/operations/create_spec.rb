describe MailingLists::Create, type: :operation do
  describe '.call' do
    it 'valid attributes' do
      subject = described_class.call(params: attributes_for(:mailing_list))
      expect(subject[:model]).to be_persisted
      expect(subject['contract.default'].errors.full_messages).to be_blank
    end

    it 'invalid attributes' do
      subject = described_class.call(params: attributes_for(:mailing_list, :invalid))
      expect(subject[:model]).not_to be_persisted
      expect(subject['contract.default'].errors.full_messages).not_to be_blank
    end
  end
end
