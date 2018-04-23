describe Subscriptions::Update, type: :operation do
  let!(:subscription) { build :subscription, :by_operation, state: :pending }

  describe '.call' do
    it 'should activate subscription' do
      params = { confirmation_token: subscription.confirmation_token, subscribe: :enable }

      expect(SubscribeSubscriptionService).to receive(:call).with(subscription, params).and_call_original

      subject = described_class.call(params: params)

      expect(subject).to be_success
      expect(subject[:model]).to eq(subscription)
      expect(subject[:model]).to be_active
    end

    it 'should not activate subscription' do
      params = { confirmation_token: subscription.confirmation_token }

      expect(SubscribeSubscriptionService).not_to receive(:call)

      subject = described_class.call(params: params)

      expect(subject).to be_failure
      expect(subject[:model]).to eq(subscription)
      expect(subject[:model]).not_to be_active
    end

    it 'should not find model' do
      params = { confirmation_token: nil, subscribe: :enable }

      subject = described_class.call(params: params)

      expect(subject).to be_failure
      expect(subject[:model]).to be_nil
    end
  end
end
