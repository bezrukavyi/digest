describe Subscriptions::FetchFromMailingList, type: :operation do
  let!(:user) { build :user, :by_operation }
  let!(:mailing_lists) { build_list :mailing_list, 2, :by_operation, user: user }
  let!(:another_subscription) { create :subscription }

  describe '.call' do
    it 'user is not exist' do
      subject = described_class.call(params: {}, current_user: nil)
      expect(subject[:model]).to be_nil
      expect(subject['result.policy.current_user']).to be_failure
      expect(subject).to be_failure
    end

    context 'user exist' do
      it 'mailing list is not exist' do
        subject = described_class.call(params: { mailing_list_id: nil }, current_user: user)
        expect(subject['result.policy.mailing_list']).to be_failure
        expect(subject).to be_failure
      end

      it 'mailing list is exist' do
        subscriptions = [
          create(:subscription, mailing_list: mailing_lists[0]),
          create(:subscription, mailing_list: mailing_lists[1])
        ]

        subject = described_class.call(params: { mailing_list_id: mailing_lists[0].id }, current_user: user)
        expect(subject[:model]).to eq([subscriptions[0]])
        expect(subject).to be_success
      end
    end
  end
end
