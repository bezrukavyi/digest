describe Subscriptions::Create, type: :operation do
  describe '.call' do
    it 'valid attributes' do
      expect(SubscribeMailJob).to receive(:perform_async)
      subject = described_class.call(params: attributes_for(:subscription))

      model = subject[:model]

      expect(model).to be_persisted
      expect(model.confirmation_token).not_to be_nil
      expect(subject['contract.default'].errors.full_messages).to be_blank
    end

    it 'invalid attributes' do
      subject = described_class.call(params: attributes_for(:mailing_list, :invalid))
      expect(subject[:model]).not_to be_persisted
      expect(subject['contract.default'].errors.full_messages).not_to be_blank
    end
  end
end
