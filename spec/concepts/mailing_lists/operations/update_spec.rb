describe MailingLists::Update, type: :operation do
  let!(:mailing_list) { build :mailing_list, :by_operation }

  let(:valid_params) { { mailing_list: attributes_for(:mailing_list) } }
  let(:invalid_params) { valid_params[:mailing_list].merge(slug: nil) }

  describe '.call' do
    it 'valid attributes' do
      subject = described_class.call(params: valid_params, id: mailing_list.id)
      expect(subject[:model]).to be_valid
      expect(subject['contract.default'].errors.full_messages).to be_blank
    end

    it 'invalid attributes' do
      subject = described_class.call(params: invalid_params, id: mailing_list.id)
      expect(subject['contract.default'].errors.full_messages).not_to be_blank
    end
  end
end
