# describe CreateSubscriptionCommand, type: :command do
#   let!(:mailing_list) { create :mailing_list }

#   context '#call' do
#     context 'valid' do
#       let(:params) { { email: FFaker::Internet.email } }
#       subject { described_class.new(mailing_list, params) }

#       it 'set success broadcast' do
#         expect { subject.call }.to broadcast(:success)
#       end

#       it 'create subscription' do
#         expect { subject.call }.to change { Subscription.count }.from(0).to(1)
#         created_subscription = Subscription.last
#         expect(created_subscription.email).to eq(params[:email])
#         expect(created_subscription.mailing_list).to eq(mailing_list)
#       end

#       it 'send email' do
#         expect(SubscribeMailJob).to receive(:perform_async)
#         subject.call
#       end
#     end

#     context 'invalid' do
#       let(:params) { { email: nil } }

#       subject { described_class.new(mailing_list, params) }

#       it 'wrong params' do
#         expect { subject.call }.to broadcast(:failure)
#         expect(Subscription.count).to be_zero
#       end
#     end
#   end
# end
