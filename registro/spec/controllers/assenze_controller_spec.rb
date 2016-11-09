require 'rails_helper'

describe AssenzeController do
  describe "GET #index" do
		it "populates an array of assenze" do
		  assenza = FactoryGirl.create(:assenza)
		  get :index
		  expect(assigns(:assenze)).to eq([assenza])
		end
		
		it "renders the :index view" do
		  get :index
		  expect(response).to render_template :index
		end
  end

	describe "GET #show" do
		it "assigns the requested assenza to @assenza" do
		  assenza = FactoryGirl.create(:assenza)
		  get :show, id: assenza
		  expect(assigns(:assenza)).to eq(assenza)
		end
		
		it "renders the #show view" do
		  get :show, id: FactoryGirl.create(:assenza)
		  expect(response).to render_template :show
		end
	end 
  
  describe "GET #new" do
    before do session_set end
    it "assigns a new assenza to @assenza" do
		  get :new
		  expect(assigns(:assenza)).to be_a_new(Assenza)
		end
    
		it "renders the :new template" do
		  get :new, id: FactoryGirl.create(:assenza)
		  expect(response).to render_template :new
		end
  end
  
  describe "POST #create" do
    before do session_set end

		before do session_set end
		  it "creates a new assenza" do
		    expect{
		      post :create, assenza: FactoryGirl.attributes_for(:assenza)
		    }.to change(Assenza,:count).by(1)
		  end
		  
		  it "redirects to the new alunno" do
		    post :create, assenza: FactoryGirl.attributes_for(:assenza)
		    expect(response).to redirect_to Assenza.last
		  end
	end
  

	describe 'DELETE destroy' do
		      before do session_set end
		before :each do
			@assenza = FactoryGirl.create(:assenza)
		end
	
		it "deletes the assenza" do
			expect{
			  delete :destroy, id: @assenza        
			}.to change(Assenza,:count).by(-1)
		end
			
		it "redirects to assenze#index" do
			delete :destroy, id: @assenza
			expect(response).to redirect_to assenze_url
		end
	end

end
