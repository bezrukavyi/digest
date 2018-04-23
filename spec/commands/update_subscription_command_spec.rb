# describe UpdateSubscriptionCommand, type: :command do
#   include Support::Double

#   let!(:subscription) { create :subscription }

#   context '#call' do
#     context 'valid' do
#       let(:params) { { subscribe: :enable, confirmation_token: subscription.confirmation_token } }
#       subject { described_class.new(params) }

#       it 'set broadcast success_subsribe' do
#         expect(SubscribeSubscriptionService).to receive(:call).with(subscription, params).and_return(double_success)
#         expect { subject.call }.to broadcast(:success_subsribe)
#       end
#     end
#   end
# end
