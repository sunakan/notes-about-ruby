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
        {
          status: 200,
          body: {
            id: Faker::Number.unique.number(9).to_i,
            owner_id: Faker::Number.unique.number(9).to_i,
            member_ids: Array.new(rand(5)).map {Faker::Number.unique.number.to_i},
            name: Faker::Book.title,
            articles: Array.new(rand(5)).map {
              {
                id: Faker::Number.unique.number(9).to_i,
                title: Faker::LeagueOfLegends.champion,
                creted_at: Faker::Date.between(10.years.ago, Date.today),
              }
            }
          }
        }.to_json
      end
    end
  end
end
