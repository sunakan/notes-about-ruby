require "singleton"
require "faker"
require "active_support/time"

module Services
  module BlogService
    class Client
      include Singleton
      def get_blog(option = {})
        response = fake_response
        JSON.parse(response)
      end

      private

        def fake_response
          articles = Array.new(rand(5)).map { fake_article }

          {
            status: 200,
            body: {
              id: fake_user_id,
              owner_id: fake_user_id,
              member_ids: Array.new(rand(5)).map { fake_user_id },
              name: Faker::Book.title,
              articles: articles
            }
          }.to_json
        end

        def fake_user_id
          Faker::Number.unique.number(9).to_i
        end

        def fake_article
          {
            id: Faker::Number.unique.number(9).to_i,
            title: Faker::LeagueOfLegends.champion,
            creted_at: Faker::Date.between(10.years.ago, Time.zone.today)
          }
        end
    end
  end
end
