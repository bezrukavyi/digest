describe LinksController, type: :controller do
  let!(:link) { create(:link) }

  describe 'GET #show' do
    it 'should redirect to link url' do
      get :show, params: { id: link.id }

      expect(response).to redirect_to(link.url)
    end
  end
end
