require "spec_helper"
require "services/blog_service/client"
require "services/blog_service/summarizer"

RSpec.describe Services::BlogService::Summarizer do
  # ちょっとサボり(本来clientに依存したくない)
  let(:response) { Services::BlogService::Client.instance.get_blog }
  let(:summarizer) { Services::BlogService::Summarizer.instance }
  describe ".extract_blog" do
    it "blogを抽出できる" do
      blog = summarizer.extract_blog(response["body"])
      expect(blog).to be_valid
    end
  end
  describe ".extract_articles" do
    it "articlesを抽出できる" do
      articles = summarizer.extract_articles(response)
      articles.each do |a|
        expect(a).to be_valid
      end
    end
  end
  describe ".summarize" do
    it "要約できる" do
      blog = summarizer.summarize(response)
      expect(blog).to be_valid
      blog.articles.each do |a|
        expect(a).to be_valid
      end
    end
  end
  describe ".as_json" do
    it "['member_ids']でArray型が返ってきてほしい" do
      blog = summarizer.summarize(response)
      json = blog.as_json(only: [:member_ids])
      expect(json["member_ids"].class).to eq(Array)
    end
  end
end
