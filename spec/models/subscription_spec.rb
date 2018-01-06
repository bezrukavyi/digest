describe Subscription, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:mailing_list) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:mailing_list) }
  end

  context 'aasm state' do
    it 'pending -> active' do
      expect(subject).to transition_from(:pending).to(:active).on_event(:activate)
    end
    it 'canceled -> active' do
      expect(subject).to transition_from(:canceled).to(:active).on_event(:activate)
    end
    it 'active -> canceled' do
      expect(subject).to transition_from(:active).to(:canceled).on_event(:cancel)
    end
  end

  context 'After create' do
    it 'Set confirmation token' do
      subject = build :subscription
      expect { subject.save }.to change { subject.confirmation_token }.from(nil)
    end
  end
end
