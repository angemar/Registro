require 'rails_helper'

describe MaterieController do
  describe "GET #index" do
		it "populates an array of materie" do
		  materia = FactoryGirl.create(:materia)
		  get :index
		  expect(assigns(:materie)).to eq([materia])
		end
		
		it "renders the :index view" do
		  get :index
		  expect(response).to render_template :index
		end
  end

	describe "GET #show" do
		it "assigns the requested materia to @materia" do
		  materia = FactoryGirl.create(:materia)
		  get :show, id: materia
		  expect(assigns(:materia)).to eq(materia)
		end
		
		it "renders the #show view" do
		  get :show, id: FactoryGirl.create(:materia)
		  expect(response).to render_template :show
		end
	end 
  
  describe "GET #new" do
    before do session_set end
    it "assigns a new materia to @materia" do
		  get :new
		  expect(assigns(:materia)).to be_a_new(Materia)
		end
    
		it "renders the :new template" do
		  get :new, id: FactoryGirl.create(:materia)
		  expect(response).to render_template :new
		end
  end
  
  describe "POST #create" do
    before do session_set end

		  it "creates a new materia" do
		    expect{
		      post :create, materia: FactoryGirl.attributes_for(:materia)
		    }.to change(Materia,:count).by(1)
		  end
		  
		  it "redirects to the new materia" do
		    post :create, materia: FactoryGirl.attributes_for(:materia)
		    expect(response).to redirect_to Materia.last
		  end
		
	end

	describe 'DELETE destroy' do
                before do session_set end
		before :each do
		  @materia = FactoryGirl.create(:materia)
		end
		
		it "deletes the contact" do
		  expect{
		    delete :destroy, id: @materia        
		  }.to change(Materia,:count).by(-1)
		end
		  
		it "redirects to materie#index" do
		  delete :destroy, id: @materia
		  expect(response).to redirect_to materie_url
		end
	end

end
