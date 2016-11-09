require 'rails_helper'

describe NotedisciplinariController do
  describe "GET #index" do
		it "populates an array of notedisciplinari" do
		  notadisciplinare = FactoryGirl.create(:notadisciplinare)
		  get :index
		  expect(assigns(:notedisciplinari)).to eq([notadisciplinare])
		end
		
		it "renders the :index view" do
		  get :index
		  expect(response).to render_template :index
		end
  end

	describe "GET #show" do
		it "assigns the requested notadisciplinare to @notadisciplinare" do
		  notadisciplinare = FactoryGirl.create(:notadisciplinare)
		  get :show, id: notadisciplinare
		  expect(assigns(:notadisciplinare)).to eq(notadisciplinare)
		end
		
		it "renders the #show view" do
		  get :show, id: FactoryGirl.create(:notadisciplinare)
		  expect(response).to render_template :show
		end
	end 
  
  describe "GET #new" do
    before do session_doc end
    it "assigns a new notadisciplinare to @notadisciplinare" do
		  get :new
		  expect(assigns(:notadisciplinare)).to be_a_new(Notadisciplinare)
		end
    
		it "renders the :new template" do
		  get :new, id: FactoryGirl.create(:notadisciplinare)
		  expect(response).to render_template :new
		end
  end
  
  describe "POST #create" do
                  before do session_doc end
		  it "creates a new notadisciplinare" do
		    expect{
		      post :create, notadisciplinare: FactoryGirl.attributes_for(:notadisciplinare)
		    }.to change(Notadisciplinare,:count).by(1)
		  end
		  
		  it "redirects to the new notadisciplinare" do
		    post :create, notadisciplinare: FactoryGirl.attributes_for(:notadisciplinare)
		    expect(response).to redirect_to Notadisciplinare.last
		  end
	end

end
