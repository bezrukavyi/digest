describe SubscribeMailService, type: :model do
  include Support::Double
  let(:subscribe_type) { :enable }
  let!(:subscription) { create :subscription }

  it '.call' do
    expect(subscription).to receive(:confirmation_token!)
    expect(SubscriptionMailer).to receive(:subscribe).with(subscription, subscribe_type).and_return(double_mail)

    described_class.call(subscription, subscribe_type)
  end
end
