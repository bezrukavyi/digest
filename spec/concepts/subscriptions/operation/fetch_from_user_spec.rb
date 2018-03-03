describe Subscriptions::FetchFromUser, type: :operation do
  let!(:user) { build :user, :by_operation }
  let!(:mailing_lists) { build_list :mailing_list, 2, :by_operation, user: user }
  let!(:another_subscription) { create :subscription }

  describe '.call' do
    it 'user is not exist' do
      subject = described_class.call(params: {}, current_user: nil)
      expect(subject[:model]).to be_nil
      expect(subject['result.policy.default']).to be_failure
      expect(subject).to be_failure
    end

    it 'user exist' do
      subscriptions = [
        create(:subscription, mailing_list: mailing_lists[0]),
        create(:subscription, mailing_list: mailing_lists[1])
      ]

      subject = described_class.call(params: {}, current_user: user)
      expect(subject[:model]).to match_array(subscriptions)
      expect(subject['result.policy.default']).to be_success
      expect(subject).to be_success
    end
  end
end
