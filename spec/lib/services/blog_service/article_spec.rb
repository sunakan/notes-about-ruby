require "spec_helper"
require "services/blog_service/article"

RSpec.describe Services::BlogService::Article, type: :model do
  let(:success_data) do
    { id: 123, title: "hello", created_at: Time.current }
  end
  describe "validation" do
    describe "パラメータが全て正しい時" do
      it "通る" do
        article = Services::BlogService::Article.new(success_data)
        expect(article).to be_valid
      end
    end
    describe "id" do
      context "nilの時" do
        it "通らない" do
          data = success_data.merge(id: nil)
          article = Services::BlogService::Article.new(data)
          expect(article).not_to be_valid
        end
      end
      context "'aaa'の時" do
        it "通らない" do
          data = success_data.merge(id: "aaa")
          article = Services::BlogService::Article.new(data)
          expect(article).not_to be_valid
        end
      end
      context "'123'の時" do
        it "通る" do
          data = success_data.merge(id: "123")
          article = Services::BlogService::Article.new(data)
          expect(article).to be_valid
        end
      end
      context "0の時" do
        it "通らない" do
          data = success_data.merge(id: 0)
          article = Services::BlogService::Article.new(data)
          expect(article).not_to be_valid
        end
      end
    end
    describe "title" do
      context "nilの時" do
        it "通らない" do
          data = success_data.merge(title: nil)
          article = Services::BlogService::Article.new(data)
          expect(article).not_to be_valid
        end
      end
      context "空文字の時" do
        it "通る" do
          data = success_data.merge(title: "")
          article = Services::BlogService::Article.new(data)
          article.title = -1
          expect(article).to be_valid
        end
      end
      context "'abc'の時" do
        it "通る" do
          data = success_data.merge(title: "abc")
          article = Services::BlogService::Article.new(data)
          expect(article).to be_valid
        end
      end
    end
    describe "created_at" do
      context "nilの時" do
        it "通らない" do
          data = success_data.merge(created_at: nil)
          article = Services::BlogService::Article.new(data)
          expect(article).not_to be_valid
        end
      end
      context "'20190101'の時" do
        it "通る" do
          data = success_data.merge(created_at: "20190101")
          article = Services::BlogService::Article.new(data)
          expect(article).to be_valid
        end
      end
      context "'2019-01-01'の時" do
        it "通る" do
          data = success_data.merge(created_at: "2019-01-01")
          article = Services::BlogService::Article.new(data)
          expect(article).to be_valid
        end
      end
      context "'2019'の時" do
        it "通らない" do
          data = success_data.merge(created_at: "2019")
          article = Services::BlogService::Article.new(data)
          expect(article).not_to be_valid
        end
      end
      context "存在しない日付の時" do
        it "通らない" do
          data = success_data.merge(created_at: "20191301")
          article = Services::BlogService::Article.new(data)
          expect(article).not_to be_valid
        end
      end
    end
  end
end
