module Subscriptions
  describe Index, type: :operation do
    let!(:user) { build :user, :by_operation }
    let!(:mailing_lists) { build_list :mailing_list, 2, :by_operation, user: user }
    let!(:subscriptions) do
      [
        create(:subscription, mailing_list: mailing_lists[0]),
        create(:subscription, mailing_list: mailing_lists[1])
      ]
    end
    let!(:another_subscription) { create :subscription }

    describe '.call' do
      it 'without mailing list id' do
        subject = described_class.call(params: { mailing_list_id: nil }, current_user: user)
        expect(subject[:model]).to match_array(subscriptions)
      end

      it 'with mailing list id' do
        subject = described_class.call(params: { mailing_list_id: mailing_lists[0].id }, current_user: user)
        expect(subject[:model]).to match_array([subscriptions[0]])
      end
    end
  end
end
