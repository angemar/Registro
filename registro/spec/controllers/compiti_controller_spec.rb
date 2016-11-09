require 'rails_helper'

describe CompitiController do
  describe "GET #index" do
		it "populates an array of compiti" do
		 compito = FactoryGirl.create(:compito)
		  get :index
		  expect(assigns(:compiti)).to eq([compito])
		end
		
		it "renders the :index view" do
		  get :index
		  expect(response).to render_template :index
		end
  end

	describe "GET #show" do
		it "assigns the requested compito to @compito" do
		  compito = FactoryGirl.create(:compito)
		  get :show, id: compito
		  expect(assigns(:compito)).to eq(compito)
		end
		
		it "renders the #show view" do
		  get :show, id: FactoryGirl.create(:compito)
		  expect(response).to render_template :show
		end
	end 
  
  
  describe "POST #create" do
    before do session_doc end
    context "with valid attributes" do
		  it "creates a new compito" do
		    expect{
		      post :create, compito: FactoryGirl.attributes_for(:compito)
		    }.to change(Compito,:count).by(1)
		  end
		  
		  it "redirects to the new compito" do
		    post :create, compito: FactoryGirl.attributes_for(:compito)
		    expect(response).to redirect_to Compito.last
		  end
		end
  
  	context "with invalid attributes" do
		  it "does not save the new compito" do
		    expect{
		      post :create, compito: FactoryGirl.attributes_for(:compito2)
		    }.to_not change(Compito,:count)
		  end
		  
		  it "re-renders the new method" do
		    post :create, compito: FactoryGirl.attributes_for(:compito2)
		    expect(response).to render_template :new
		  end
		end 
	end

end
