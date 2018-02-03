describe SubscribeSubscriptionService, type: :model do
  let!(:subscription) { create :subscription }

  describe '.call' do
    context 'valid' do
      it 'enable' do
        expect(SubscribeMailJob).not_to receive(:perform_async).with(subscription.id, :disable)
        subject = described_class.new(subscription, subscribe: :enable)
        expect { subject.call }.to change { subscription.reload.aasm_state }.from('pending').to('active')
      end

      it 'disable' do
        subscription.activate
        expect(SubscribeMailJob).to receive(:perform_async).with(subscription.id, :enable)
        subject = described_class.new(subscription, subscribe: :disable)
        expect { subject.call }.to change { subscription.reload.aasm_state }.from('active').to('canceled')
      end
    end

    context 'invalid' do
      before do
        expect(SubscribeMailJob).not_to receive(:perform_async)
      end

      it 'wrong subscribe attribute' do
        subject = described_class.new(subscription, subscribe: nil)
        result = subject.call
        expect(result.success?).to be_falsey
      end

      it 'missing subscribe' do
        subject = described_class.new(nil, subscribe: :enable)
        result = subject.call
        expect(result.success?).to be_falsey
      end
    end
  end
end
