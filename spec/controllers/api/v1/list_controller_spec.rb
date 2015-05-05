require 'rails_helper'

RSpec.describe Api::V1::ListController, type: :controller do
  let(:list) { create(:list) }

  describe "get show" do
    it "it returns a specific list" do
      get :show, id: list.id
      list = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(list["title"]).to eq("My First List")
    end
  end

  describe "post create" do
    it "creates a list" do
      expect(List.count).to eq(0)

      post :create, list: { title: "My second list", archived: false }

      expect(response).to have_http_status(:success)
      expect(List.count).to eq(1)
    end
  end

  describe "put update" do
    it "can edit a lists attributes" do
      put :update, id: list.id, list: { title: "My Revised First List" }
      get :show, id: list.id

      list = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(list["title"]).to eq("My Revised First List")
    end
  end

  describe "delete destroy" do
    it "can delete a list" do
      post :create, list: { title: "My second list", archived: false }
      new_list = JSON.parse(response.body)
      delete :destroy, id: new_list["id"]

      expect(response).to have_http_status(:success)
      expect(List.count).to eq(0)
    end
  end
end
