require "singleton"
require "services/blog_service/blog"
require "services/blog_service/article"

module Services
  module BlogService
    class Summarizer
      include Singleton
      def summarize(data)
        body_data = data["body"] || data
        blog      = extract_blog(body_data)
        articles  = extract_articles(body_data)
        blog.tap { |b| b.articles = articles }
      end

      def extract_blog(data)
        data = data["body"] || data
        attributes = data.slice("id", "owner_id", "name")
        member_ids = data.slice("member_ids")
        Blog.new(attributes).tap { |b| b.member_ids = member_ids || [] }
      end

      def extract_articles(data)
        data = data["body"] || data
        (data["articles"] || []).map { |a| Article.new(a) }
      end
    end
  end
end
