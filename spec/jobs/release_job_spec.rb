describe ReleaseJob, job: true do
  describe '.perform_async' do
    it 'calls ReleaseService' do
      expect(ReleaseService).to receive(:call)

      ReleaseJob.perform_async
    end
  end
end
