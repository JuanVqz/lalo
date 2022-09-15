require "rails_helper"

RSpec.describe "/orders", type: :request do

  let(:item) { create(:item) }
  let(:valid_attributes) do
    {
      comment: "My Text",
      line_items_attributes: [
       { quantity:1.0, item_id: item.to_param, },
      ]
    }
  end

  let(:invalid_attributes) {
    attributes_for(:order)
  }

  describe "GET /index" do
    it "renders a successful response" do
      Order.create! valid_attributes
      get orders_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      order = Order.create! valid_attributes
      get order_url(order)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_order_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      order = Order.create! valid_attributes
      get edit_order_url(order)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Order with LineItem" do
        expect {
          post orders_url, params: { order: valid_attributes }
        }.to change(Order, :count).by(1)
          .and change(LineItem, :count).by(1)
      end

      it "redirects to the created order" do
        post orders_url, params: { order: valid_attributes }
        expect(response).to redirect_to(order_url(Order.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Order" do
        expect {
          post orders_url, params: { order: invalid_attributes }
        }.to change(Order, :count).by(0)
      end


      it "renders a response with 422 status" do
        post orders_url, params: { order: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {comment: "new comment"}
      }

      it "updates the requested order" do
        order = Order.create! valid_attributes
        patch order_url(order), params: { order: new_attributes }
        order.reload
        expect(order.comment).to eq "new comment"
      end

      it "redirects to the order" do
        order = Order.create! valid_attributes
        patch order_url(order), params: { order: new_attributes }
        order.reload
        expect(response).to redirect_to(order_url(order))
      end
    end

    context "with invalid parameters" do
      let(:order) { Order.create! valid_attributes }
      let(:line_item) { order.line_items.last }

      it "renders a response with 422 status" do
        invalid_attributes = {
          comment: order.comment,
          line_items_attributes: [
            { id: line_item.to_param, _destroy: 1 }
          ]
        }
        patch order_url(order), params: { order: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested order with existing line_items" do
      order = Order.create! valid_attributes
      expect {
        delete order_url(order)
      }.to change(Order, :count).by(-1)
        .and change(LineItem, :count).by(-1)
    end

    it "redirects to the orders list" do
      order = Order.create! valid_attributes
      delete order_url(order)
      expect(response).to redirect_to(orders_url)
    end
  end
end
