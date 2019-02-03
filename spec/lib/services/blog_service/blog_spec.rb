require "spec_helper"
require "services/blog_service/blog"

RSpec.describe Services::BlogService::Blog, type: :model do
  let(:success_data) do
    { id: 123, owner_id: 123, name: "my blog" }
  end
  describe "validation" do
    describe "パラメータが全て正しい時" do
      it "通る" do
        blog = Services::BlogService::Blog.new(success_data)
        expect(blog).to be_valid
      end
    end
    describe "id" do
      context "nilの時" do
        it "通らない" do
          data = success_data.merge(id: nil)
          blog = Services::BlogService::Blog.new(data)
          expect(blog).not_to be_valid
        end
      end
      context "'aaa'の時" do
        it "通らない" do
          data = success_data.merge(id: "aaa")
          blog = Services::BlogService::Blog.new(data)
          expect(blog).not_to be_valid
        end
      end
      context "'123'の時" do
        it "通る" do
          data = success_data.merge(id: "123")
          blog = Services::BlogService::Blog.new(data)
          expect(blog).to be_valid
        end
      end
    end
    describe "owner_id" do
      context "nilの時" do
        it "通らない" do
          data = success_data.merge(owner_id: nil)
          blog = Services::BlogService::Blog.new(data)
          expect(blog).not_to be_valid
        end
      end
      context "'aaa'の時" do
        it "通らない" do
          data = success_data.merge(owner_id: "aaa")
          blog = Services::BlogService::Blog.new(data)
          expect(blog).not_to be_valid
        end
      end
      context "'123'の時" do
        it "通る" do
          data = success_data.merge(owner_id: "123")
          blog = Services::BlogService::Blog.new(data)
          expect(blog).to be_valid
        end
      end
    end
    describe "name" do
      context "nilの時" do
        it "通らない" do
          data = success_data.merge(name: nil)
          blog = Services::BlogService::Blog.new(data)
          expect(blog).not_to be_valid
        end
      end
      context "空文字の時" do
        it "通る" do
          data = success_data.merge(name: "")
          blog = Services::BlogService::Blog.new(data)
          expect(blog).to be_valid
        end
      end
      context "'aaa'の時" do
        it "通る" do
          data = success_data.merge(name: "aaa")
          blog = Services::BlogService::Blog.new(data)
          expect(blog).to be_valid
        end
      end
    end
  end
end
