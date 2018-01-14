describe Link, type: :model do
  context 'associations' do
    it { expect(subject).to belong_to(:issue_item) }
  end

  context 'validations' do
    it { expect(subject).to validate_presence_of(:url) }
  end
end
