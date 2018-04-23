describe Dashboard::Issues::Contracts::Create, type: :form_object do
  let(:issue_attributes) { attributes_for(:issue) }
  subject { described_class.new(Issue.new) }

  let(:issue_items_attirbutes) do
    [
      attributes_for(:issue_item),
      attributes_for(:issue_item)
    ]
  end

  let(:subtitles_attirbutes) do
    [
      attributes_for(:subtitle),
      attributes_for(:subtitle)
    ]
  end

  describe '.call' do
    context 'valid attributes' do
      it 'should create issue with issue items and subtitles' do
        data = issue_attributes.merge(
          issue_items: issue_items_attirbutes,
          subtitles: subtitles_attirbutes
        )

        subject.submit(data)
        model = subject.model.reload

        expect(subject.valid?).to be_truthy
        expect(model).to be_persisted
        expect(model.issue_items).not_to be_blank
        expect(model.subtitles).not_to be_blank
      end

      it 'should create issue with issue items and subtitles with issue items' do
        data = issue_attributes.merge(
          issue_items: issue_items_attirbutes,
          subtitles: subtitles_attirbutes
        )

        subject.submit(data)
        model = subject.model.reload

        expect(subject.valid?).to be_truthy
        expect(model).to be_persisted
        expect(model.issue_items).not_to be_blank
        expect(model.subtitles).not_to be_blank
        expect(model.subtitles.map(&:issue_items)).not_to be_blank
      end
    end

    context 'invalid attributes' do
      let(:invalid_issue_items_attirbutes) do
        [
          attributes_for(:issue_item, description: nil),
          attributes_for(:issue_item, source: nil)
        ]
      end

      after do
        expect(subject.valid?).to be_falsey
        expect(subject.model).not_to be_persisted
        expect(subject.model.issue_items).to be_blank
        expect(subject.model.subtitles).to be_blank
      end

      it 'should return errors for issue item only in issue' do
        data = issue_attributes.merge(
          issue_items: invalid_issue_items_attirbutes,
          subtitles: subtitles_attirbutes
        )

        subject.submit(data)

        errors = ParseContractError.call(subject)

        expect(errors[:issue_items][0].keys).to eq([:description])
        expect(errors[:issue_items][1].keys).to eq([:source])
        expect(errors[:subtitles][1][:issue_items]).to be_empty
      end

      it 'should return errors for issue item only in subtitles' do
        subtitles_attirbutes[1][:issue_items] = invalid_issue_items_attirbutes

        data = issue_attributes.merge(
          issue_items: issue_items_attirbutes,
          subtitles: subtitles_attirbutes
        )

        subject.submit(data)

        errors = ParseContractError.call(subject)

        expect(errors[:issue_items][0].keys).to be_empty
        expect(errors[:subtitles][1][:issue_items][0].keys).to eq([:description])
        expect(errors[:subtitles][1][:issue_items][1].keys).to eq([:source])
      end

      it 'should return errors for issue item in issue and subtitles' do
        subtitles_attirbutes[0][:issue_items] = invalid_issue_items_attirbutes

        data = issue_attributes.merge(
          issue_items: invalid_issue_items_attirbutes,
          subtitles: subtitles_attirbutes
        )

        subject.submit(data)

        errors = ParseContractError.call(subject)

        expect(errors[:issue_items][0].keys).to eq([:description])
        expect(errors[:subtitles][0][:issue_items][0].keys).to eq([:description])
      end
    end
  end
end
