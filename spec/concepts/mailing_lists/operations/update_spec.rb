describe MailingLists::Update, type: :operation do
  let!(:user) { build :user, :by_operation }
  let!(:mailing_list) { build :mailing_list, :by_operation, user: user }

  let(:valid_params) { { mailing_list: attributes_for(:mailing_list) } }
  let(:invalid_params) { valid_params[:mailing_list].merge(slug: nil) }

  describe '.call' do
    it 'valid attributes' do
      subject = described_class.call(params: valid_params, current_user: user, id: mailing_list.id)
      expect(subject[:model]).to be_valid
      expect(subject['contract.default'].errors.full_messages).to be_blank
    end

    it 'invalid attributes' do
      subject = described_class.call(params: invalid_params, current_user: user, id: mailing_list.id)
      expect(subject['contract.default'].errors.full_messages).not_to be_blank
    end

    it 'not authorized' do
      another_user = build :user, :by_operation
      subject = described_class.call(params: invalid_params, current_user: another_user, id: mailing_list.id)
      expect(subject['result.policy.default']).to be_failure
    end
  end
end
