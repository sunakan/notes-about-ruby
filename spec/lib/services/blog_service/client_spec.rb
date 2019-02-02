require "spec_helper"
require "services/blog_service/client"

RSpec.describe Services::BlogService::Client do
  let(:client) {Services::BlogService::Client.instance()}
  describe ".get_blog" do
    it "status は 200" do
      response = client.get_blog()
      expect(response["status"]).to eq(200)
    end
  end
end
