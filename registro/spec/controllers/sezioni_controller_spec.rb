require 'rails_helper'

describe SezioniController do
  describe "GET #index" do
		it "populates an array of sezioni" do
		  sezione = FactoryGirl.create(:sezione)
		  get :index
		  expect(assigns(:sezioni)).to eq([sezione])
		end
		
		it "renders the :index view" do
		  get :index
		  expect(response).to render_template :index
		end
  end

	describe "GET #show" do
		it "assigns the requested sezione to @sezione" do
		  sezione = FactoryGirl.create(:sezione)
		  get :show, id: sezione
		  expect(assigns(:sezione)).to eq(sezione)
		end
		
		it "renders the #show view" do
		  get :show, id: FactoryGirl.create(:sezione)
		  expect(response).to render_template :show
		end
	end 
  
  describe "GET #new" do
    before do session_set end
    it "assigns a new sezione to @sezione" do
		  get :new
		  expect(assigns(:sezione)).to be_a_new(Sezione)
		end
    
		it "renders the :new template" do
		  get :new, id: FactoryGirl.create(:sezione)
		  expect(response).to render_template :new
		end
  end
  
  describe "POST #create" do
    before do session_set end
    context "with valid attributes" do
		  it "creates a new sezione" do
		    expect{
		      post :create, sezione: FactoryGirl.attributes_for(:sezione)
		    }.to change(Sezione,:count).by(1)
		  end
		  
		  it "redirects to the new sezione" do
		    post :create, sezione: FactoryGirl.attributes_for(:sezione)
		    expect(response).to redirect_to Sezione.last
		  end
		end
  
  	context "with invalid attributes" do
		  it "does not save the new sezione" do
		    expect{
		      post :create, sezione: FactoryGirl.attributes_for(:sezione2)
		    }.to_not change(Sezione,:count)
		  end
		  
		  it "re-renders the new method" do
		    post :create, sezione: FactoryGirl.attributes_for(:sezione2)
		    expect(response).to render_template :new
		  end
		end 
	end

	describe 'DELETE destroy' do
                before do session_set end
		before :each do
		  @sezione = FactoryGirl.create(:sezione)
		end
		
		it "deletes the contact" do
		  expect{
		    delete :destroy, id: @sezione        
		  }.to change(Sezione,:count).by(-1)
		end
		  
		it "redirects to sezioni#index" do
		  delete :destroy, id: @sezione
		  expect(response).to redirect_to sezioni_url
		end
	end

end
