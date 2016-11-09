require 'rails_helper'

describe AlunniController do
  describe "GET #index" do
		it "populates an array of alunni" do
		  alunno = FactoryGirl.create(:alunno)
		  get :index
		  expect(assigns(:alunni)).to eq([alunno])
		end
		
		it "renders the :index view" do
		  get :index
		  expect(response).to render_template :index
		end
  end

	describe "GET #show" do
		it "assigns the requested alunno to @alunno" do
		  alunno = FactoryGirl.create(:alunno)
		  get :show, id: alunno
		  expect(assigns(:alunno)).to eq(alunno)
		end
		
		it "renders the #show view" do
		  get :show, id: FactoryGirl.create(:alunno)
		  expect(response).to render_template :show
		end
	end 
  
  describe "GET #new" do
    it "assigns a new alunno to @alunno" do
		  get :new
		  expect(assigns(:alunno)).to be_a_new(Alunno)
		end
    
		it "renders the :new template" do
		  get :new, id: FactoryGirl.create(:alunno)
		  expect(response).to render_template :new
		end
  end
  
  describe "POST #create" do
    context "with valid attributes" do
		  it "creates a new alunno" do
		    expect{
		      post :create, alunno: FactoryGirl.attributes_for(:alunno)
		    }.to change(Alunno,:count).by(1)
		  end
		  
		  it "redirects to the new alunno" do
		    post :create, alunno: FactoryGirl.attributes_for(:alunno)
		    expect(response).to redirect_to Alunno.last
		  end
		end
  
  	context "with invalid attributes" do
		  it "does not save the new alunno" do
		    expect{
		      post :create, alunno: FactoryGirl.attributes_for(:alunno2)
		    }.to_not change(Alunno,:count)
		  end
		  
		  it "re-renders the new method" do
		    post :create, alunno: FactoryGirl.attributes_for(:alunno2)
		    expect(response).to render_template :new
		  end
		end 
	end

	describe 'DELETE destroy' do
		before :each do
		  @alunno = FactoryGirl.create(:alunno)
		end
		
		it "deletes the contact" do
		  expect{
		    delete :destroy, id: @alunno        
		  }.to change(Alunno,:count).by(-1)
		end
		  
		it "redirects to alunni#index" do
		  delete :destroy, id: @alunno
		  expect(response).to redirect_to alunni_url
		end
	end

end
