RSpec.describe Api::V1::TasksController, type: :controller do
  let(:list) { create(:list) }
  let(:task1) { create(:task) }
  let(:task2) { create(:task, title: "go for icecream!") }

  before(:each) do
    list.tasks << [task1, task2]
  end

  describe "get index" do

    it "can get an list of tasks" do
      get :index, id: list.id

      tasks = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(tasks.first["title"]).to eq("clean the kitchen")
      expect(tasks.last["title"]).to eq("go for icecream!")
    end
  end

  describe "get show" do
    it "can get a specific task" do
      get :show, id: task1.id

      task = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(task["title"]).to eq("clean the kitchen")
    end
  end

  describe "post create" do
    it "can create a task" do
      post :create, task: { title: "newest task", status: "incomplete", due: "5/6/15" }

      expect(response).to have_http_status(:success)
      expect(Task.count).to eq(3)
    end
  end

  describe "put update" do
    it "can update a task" do
      put :update, id: task1.id, task: { title: "I don't want to clean the kitchen" }
      get :show, id: task1.id

      task = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(task["title"]).to eq("I don't want to clean the kitchen")
    end
  end

  describe "delete destroy" do
    it "can delete a task" do
      task4 = create(:task)
      delete :destroy, id: task4.id

      expect(response).to have_http_status(:success)
      expect(Task.count).to eq(2)
    end
  end
end
