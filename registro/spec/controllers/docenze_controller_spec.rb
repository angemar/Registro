require 'rails_helper'

describe DocenzeController do
  describe "GET #index" do
		it "populates an array of docenze" do
		  docenza = FactoryGirl.create(:docenza)
		  get :index
		  expect(assigns(:docenze)).to eq([docenza])
		end
		
		it "renders the :index view" do
		  get :index
		  expect(response).to render_template :index
		end
  end

	describe "GET #show" do
		it "assigns the requested docenza to @docenza" do
		  docenza = FactoryGirl.create(:docenza)
		  get :show, id: docenza
		  expect(assigns(:docenza)).to eq(docenza)
		end
		
		it "renders the #show view" do
		  get :show, id: FactoryGirl.create(:docenza)
		  expect(response).to render_template :show
		end
	end 
  
  describe "GET #new" do
    it "assigns a new docenza to @docenza" do
		  get :new
		  expect(assigns(:docenza)).to be_a_new(Docenza)
		end
    
		it "renders the :new template" do
		  get :new, id: FactoryGirl.create(:docenza)
		  expect(response).to render_template :new
		end
  end
  
  describe "POST #create" do
    context "with valid attributes" do
		  it "creates a new docenza" do
		    expect{
		      post :create, docenza: FactoryGirl.attributes_for(:docenza)
		    }.to change(Docenza,:count).by(1)
		  end
		  
		  it "redirects to the new docenza" do
		    post :create, docenza: FactoryGirl.attributes_for(:docenza)
		    expect(response).to redirect_to Docenza.last
		  end
		end
  
  	context "with invalid attributes" do
		  it "does not save the new docenza" do
		    expect{
		      post :create, docenza: FactoryGirl.attributes_for(:docenza2)
		    }.to_not change(Docenza, :count)
		  end
		  
		  it "re-renders the new method" do
		    post :create, docenza: FactoryGirl.attributes_for(:docenza2)
		    expect(response).to render_template :new
		  end
		end 
	end

	describe 'DELETE destroy' do
		before :each do
		  @docenza = FactoryGirl.create(:docenza)
		end
		
		it "deletes the contact" do
		  expect{
		    delete :destroy, id: @docenza        
		  }.to change(Docenza,:count).by(-1)
		end
		  
		it "redirects to docenze#index" do
		  delete :destroy, id: @docenza
		  expect(response).to redirect_to docenze_url
		end
	end

end
