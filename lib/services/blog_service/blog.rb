require "active_model"

module Services
  module BlogService
    class Blog
      include ActiveModel::Model
      include ActiveModel::Attributes
      include ActiveModel::Validations
      include ActiveModel::Serializers::JSON

      attribute :id,       :integer, default: nil
      attribute :owner_id, :integer, default: nil
      attribute :name,     :string,  default: ""
      attribute :member_ids, ActiveModel::Type::Value.new, default: []

      attr_accessor :articles

      validates_numericality_of :id,       greater_than: 0
      validates_numericality_of :owner_id, greater_than: 0
      validates_length_of       :name,     minimum: 0

      def initialize(*args)
        super(*args)
        @articles = []
      end

      # ActiveModel::Type::Valueで宣言すると、
      # as_jsonなどで、"member_ids" => {"member_ids" => []} となってしまう
      def serializable_hash(options = nil)
        result = super(options)
        result.tap do |r|
          a = r.dig("member_ids", "member_ids")
          r["member_ids"] = a if a
        end
      end
    end
  end
end
