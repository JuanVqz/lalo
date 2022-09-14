require "rails_helper"

RSpec.describe "/items", type: :request do

  let(:valid_attributes) {
    attributes_for(:item)
  }

  let(:invalid_attributes) {
   attributes_for(:item).merge(name: nil)
  }

  describe "GET /index" do
    it "renders a successful response" do
      Item.create! valid_attributes
      get items_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      item = Item.create! valid_attributes
      get item_url(item)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_item_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      item = Item.create! valid_attributes
      get edit_item_url(item)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Item" do
        expect {
          post items_url, params: { item: valid_attributes }
        }.to change(Item, :count).by(1)
      end

      it "redirects to the created item" do
        post items_url, params: { item: valid_attributes }
        expect(response).to redirect_to(item_url(Item.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Item" do
        expect {
          post items_url, params: { item: invalid_attributes }
        }.to change(Item, :count).by(0)
      end


      it "renders a response with 422 status" do
        post items_url, params: { item: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        { name: "new item" }
      end

      it "updates the requested item" do
        item = Item.create! valid_attributes
        patch item_url(item), params: { item: new_attributes }
        item.reload
        expect(item.name).to eq new_attributes[:name]
      end

      it "redirects to the item" do
        item = Item.create! valid_attributes
        patch item_url(item), params: { item: new_attributes }
        item.reload
        expect(response).to redirect_to(item_url(item))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status" do
        item = Item.create! valid_attributes
        patch item_url(item), params: { item: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested item" do
      item = Item.create! valid_attributes
      expect {
        delete item_url(item)
      }.to change(Item, :count).by(-1)
    end

    it "redirects to the items list" do
      item = Item.create! valid_attributes
      delete item_url(item)
      expect(response).to redirect_to(items_url)
    end
  end
end
