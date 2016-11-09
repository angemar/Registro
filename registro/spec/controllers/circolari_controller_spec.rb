require 'rails_helper'

describe CircolariController do
  describe "GET #index" do
		it "populates an array of circolari" do
		  circolare = FactoryGirl.create(:circolare)
		  get :index
		  expect(assigns(:circolari)).to eq([circolare])
		end
		
		it "renders the :index view" do
		  get :index
		  expect(response).to render_template :index
		end
  end

	describe "GET #show" do
		it "assigns the requested circolare to @circolare" do
		  circolare = FactoryGirl.create(:circolare)
		  get :show, id: circolare
		  expect(assigns(:circolare)).to eq(circolare)
		end
		
		it "renders the #show view" do
		  get :show, id: FactoryGirl.create(:circolare)
		  expect(response).to render_template :show
		end
	end 
  
  describe "GET #new" do
    before do session_set end
    it "assigns a new circolare to @circolare" do
		  get :new
		  expect(assigns(:circolare)).to be_a_new(Circolare)
		end
    
		it "renders the :new template" do
		  get :new, id: FactoryGirl.create(:circolare)
		  expect(response).to render_template :new
		end
  end
  
  describe "POST #create" do
    before do session_set end
    context "with valid attributes" do
		  it "creates a new circolare" do
		    expect{
		      post :create, circolare: FactoryGirl.attributes_for(:circolare)
		    }.to change(Circolare,:count).by(1)
		  end
		  
		  it "redirects to the new circolare" do
		    post :create, circolare: FactoryGirl.attributes_for(:circolare)
		    expect(response).to redirect_to Circolare.last
		  end
		end
  
  	context "with invalid attributes" do
		  it "does not save the new circolare" do
		    expect{
		      post :create, circolare: FactoryGirl.attributes_for(:circolare2)
		    }.to_not change(Circolare,:count)
		  end
		  
		  it "re-renders the new method" do
		    post :create, circolare: FactoryGirl.attributes_for(:circolare2)
		    expect(response).to render_template :new
		  end
		end 
	end

	describe 'DELETE destroy' do
                before do session_set end
		before :each do
		  @circolare = FactoryGirl.create(:circolare)
		end
		
		it "deletes the contact" do
		  expect{
		    delete :destroy, id: @circolare        
		  }.to change(Circolare,:count).by(-1)
		end
		  
		it "redirects to circolari#index" do
		  delete :destroy, id: @circolare
		  expect(response).to redirect_to circolari_url
		end
	end

end
