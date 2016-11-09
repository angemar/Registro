require 'rails_helper'

describe AmministrazioniController do
  describe "GET #index" do
		it "populates an array of amministrazioni" do
		  amministrazione = FactoryGirl.create(:amministrazione)
		  get :index
		  expect(assigns(:amministrazioni)).to eq([amministrazione])
		end
		
		it "renders the :index view" do
		  get :index
		  expect(response).to render_template :index
		end
  end

	describe "GET #show" do
		it "assigns the requested amministrazione to @amministrazione" do
		  amministrazione = FactoryGirl.create(:amministrazione)
		  get :show, id: amministrazione
		  expect(assigns(:amministrazione)).to eq(amministrazione)
		end
		
		it "renders the #show view" do
		  get :show, id: FactoryGirl.create(:amministrazione)
		  expect(response).to render_template :show
		end
	end 
  
  describe "GET #new" do
    it "assigns a new amministrazione to @amministrazione" do
		  get :new
		  expect(assigns(:amministrazione)).to be_a_new(Amministrazione)
		end
    
		it "renders the :new template" do
		  get :new, id: FactoryGirl.create(:amministrazione)
		  expect(response).to render_template :new
		end
  end
  
  describe "POST #create" do
    context "with valid attributes" do
		  it "creates a new amministrazione" do
		    expect{
		      post :create, amministrazione: FactoryGirl.attributes_for(:amministrazione)
		    }.to change(Amministrazione,:count).by(1)
		  end
		  
		  it "redirects to the new alunno" do
		    post :create, amministrazione: FactoryGirl.attributes_for(:amministrazione)
		    expect(response).to redirect_to Amministrazione.last
		  end
		end
  
  	context "with invalid attributes" do
		  it "does not save the new amministrazione" do
		    expect{
		      post :create, amministrazione: FactoryGirl.attributes_for(:amministrazione2)
		    }.to_not change(Amministrazione,:count)
		  end
		  
		  it "re-renders the new method" do
		    post :create, amministrazione: FactoryGirl.attributes_for(:amministrazione2)
		    expect(response).to render_template :new
		  end
		end 
	end

	describe 'DELETE destroy' do
		before :each do
		  @amministrazione = FactoryGirl.create(:amministrazione)
		end
		
		it "deletes the amministrazione" do
		  expect{
		    delete :destroy, id: @amministrazione        
		  }.to change(Amministrazione,:count).by(-1)
		end
		  
		it "redirects to amministrazioni#index" do
		  delete :destroy, id: @amministrazione
		  expect(response).to redirect_to root_url
		end
	end

end
