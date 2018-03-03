describe AuthProviders::Identify, type: :operation do
  describe '.call' do
    context 'when user exist' do
      let!(:user) { build :user, :by_operation}
      let!(:params) do
        {
          info: { email: user.email }
        }
      end

      it 'must find provider' do
        auth_provider = build :auth_provider, :by_operation, resource: user
        params.merge!(uid: auth_provider.uid, provider: auth_provider.name)
        result = described_class.call(params: params)

        expect(AuthProvider.count).to eq(1)
        expect(result[:model]).to eq(auth_provider)
        expect(result).to be_success
      end

      it 'must create provider' do
        attrs = attributes_for(:auth_provider)
        params.merge!(uid: attrs[:uid], provider: attrs[:name])

        result = described_class.call(params: params)

        expect(user.auth_providers.count).to eq(1)
        expect(result[:model]).to eq(user.auth_providers.last)
        expect(result).to be_success
      end
    end

    context 'when dont user exist' do
      let!(:attrs) { attributes_for(:auth_provider) }
      let!(:params) do
        {
          uid: attrs[:uid],
          provider: attrs[:name],
          info: { email: FFaker::Internet.email }
        }
      end

      it 'must create user and provider' do
        result = described_class.call(params: params)
        user = User.find_by(email: params[:info][:email])

        expect(result[:current_user]).to eq(user)
        expect(result[:current_user].auth_providers.count).to eq(1)
        expect(result[:model]).to eq(user.auth_providers.last)
        expect(result).to be_success
      end

      it 'mustnt create user' do
        params[:info][:email] = nil
        result = described_class.call(params: params)

        expect(result[:current_user]).not_to be_persisted
        expect(result).to be_failure
      end

      it 'mustnt create provider' do
        params[:uid] = nil
        result = described_class.call(params: params)
        user = User.find_by(email: params[:info][:email])

        expect(result[:current_user]).to eq(user)
        expect(result[:model]).not_to be_persisted
        expect(result).to be_failure
      end
    end
  end
end
