describe Subscription, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:mailing_list) }
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
end
