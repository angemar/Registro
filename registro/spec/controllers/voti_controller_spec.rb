require 'rails_helper'

describe VotiController do
  describe "GET #index" do
		it "populates an array of voti" do
		  voto = FactoryGirl.create(:voto)
		  get :index
		  expect(assigns(:voti)).to eq([voto])
		end
		
		it "renders the :index view" do
		  get :index
		  expect(response).to render_template :index
		end
  end

	describe "GET #show" do
		it "assigns the requested voto to @voto" do
		  voto = FactoryGirl.create(:voto)
		  get :show, id: voto
		  expect(assigns(:voto)).to eq(voto)
		end
		
		it "renders the #show view" do
		  get :show, id: FactoryGirl.create(:voto)
		  expect(response).to render_template :show
		end
	end 
  
  describe "POST #create" do
    context "with valid attributes" do
		  it "creates a new voto" do
		    expect{
		      post :create, voto: FactoryGirl.attributes_for(:voto)
		    }.to change(Voto,:count).by(1)
		  end
		  
		  it "redirects to the new voto" do
		    post :create, voto: FactoryGirl.attributes_for(:voto)
		    expect(response).to redirect_to Voto.last
		  end
		end
  
  	context "with invalid attributes" do
		  it "does not save the new voto" do
		    expect{
		      post :create, voto: FactoryGirl.attributes_for(:voto2)
		    }.to_not change(Voto,:count)
		  end
		  
		  it "re-renders the new method" do
		    post :create, voto: FactoryGirl.attributes_for(:voto2)
		    expect(response).to render_template :new
		  end
		end 
	end

	describe 'DELETE destroy' do
		before :each do
		  @voto = FactoryGirl.create(:voto)
		end
		
		it "deletes the contact" do
		  expect{
		    delete :destroy, id: @voto        
		  }.to change(Voto,:count).by(-1)
		end
		  
		it "redirects to voti#index" do
		  delete :destroy, id: @voto
		  expect(response).to redirect_to voti_url
		end
	end

end
