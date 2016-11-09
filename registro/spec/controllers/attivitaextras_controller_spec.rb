require 'rails_helper'

describe AttivitaextrasController do
  describe "GET #index" do
		it "populates an array of attivitaextras" do
		  attivitaextra = FactoryGirl.create(:attivitaextra)
		  get :index
		  expect(assigns(:attivitaextras)).to eq([attivitaextra])
		end
		
		it "renders the :index view" do
		  get :index
		  expect(response).to render_template :index
		end
  end

	describe "GET #show" do
		it "assigns the requested attivitaextra to @attivitaextra" do
		  attivitaextra = FactoryGirl.create(:attivitaextra)
		  get :show, id: attivitaextra
		  expect(assigns(:attivitaextra)).to eq(attivitaextra)
		end
		
		it "renders the #show view" do
		  get :show, id: FactoryGirl.create(:attivitaextra)
		  expect(response).to render_template :show
		end
	end 
  
  describe "GET #new" do
    before do session_doc end
    it "assigns a new attivitaextra to @attivitaextra" do
		  get :new
		  expect(assigns(:attivitaextra)).to be_a_new(Attivitaextra)
		end
    
		it "renders the :new template" do
		  get :new, id: FactoryGirl.create(:attivitaextra)
		  expect(response).to render_template :new
		end
  end
  
  describe "POST #create" do
    before do session_doc end
    context "with valid attributes" do
		  it "creates a new attivitaextra" do
		    expect{
		      post :create, attivitaextra: FactoryGirl.attributes_for(:attivitaextra)
		    }.to change(Attivitaextra,:count).by(1)
		  end
		  
		  it "redirects to the new attivitaextra" do
		    post :create, attivitaextra: FactoryGirl.attributes_for(:attivitaextra)
		    expect(response).to redirect_to Attivitaextra.last
		  end
		end
  
  	context "with invalid attributes" do
		  it "does not save the new attivitaextra" do
		    expect{
		      post :create, attivitaextra: FactoryGirl.attributes_for(:attivitaextra2)
		    }.to_not change(Attivitaextra,:count)
		  end
		  
		  it "re-renders the new method" do
		    post :create, attivitaextra: FactoryGirl.attributes_for(:attivitaextra2)
		    expect(response).to render_template :new
		  end
		end 
	end

end
