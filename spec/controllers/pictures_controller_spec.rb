require 'spec_helper'

describe PicturesController do
  let(:user) { create(:user) }
  let(:monument) { create(:monument, user: user) }

  before do
    allow_message_expectations_on_nil
    request.env['warden'].stub :authenticate! => user
    allow(controller).to receive(:current_user) { user }
  end

  describe 'GET index' do
    let(:picture) { create(:picture, monument: monument) }
    it 'assigns all pictures as @pictures' do
      get :index, monument_id: monument.id
      assigns(:pictures).should eq([picture])
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Picture' do
        expect {
          post :create, monument_id: monument.id,
               picture: build(:picture).attributes
        }.to change(Picture, :count).by(1)
      end

      it 'assigns a newly created picture as @picture' do
        post :create, monument_id: monument.id,
             picture: build(:picture).attributes
        assigns(:picture).should be_a(Picture)
        assigns(:picture).should be_persisted
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved picture as @picture' do
        Picture.any_instance.stub(:save).and_return(false)
        post :create, monument_id: monument.id, picture: { 'name' => nil }
        assigns(:picture).should be_a_new(Picture)
      end

      it "re-renders the 'new' template" do
        Picture.any_instance.stub(:save).and_return(false)
        post :create, monument_id: monument.id, picture: { 'name' => nil }
        response.should render_template('new')
      end
    end
  end
end
