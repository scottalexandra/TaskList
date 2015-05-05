require 'rails_helper'

RSpec.describe Api::V1::TagsController, type: :controller do
  let!(:tag1) { create(:tag) }
  let!(:tag2) { create(:tag, title: "fun")}

  describe "get index" do
    it "returns a list of tags" do
      get :index

      tags = JSON.parse(response.body)["tags"]

      expect(response).to have_http_status(:success)
      expect(tags.first["title"]).to eq("chores")
    end
  end

  describe "get show" do
    it "returns a specific tag" do
      get :show, id: tag2.id

      tag = JSON.parse(response.body)["tag"]

      expect(response).to have_http_status(:success)
      expect(tag["title"]).to eq("fun")
    end
  end
end
