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

      attr_accessor :member_ids

      validates_numericality_of :id,       greater_than: 0
      validates_numericality_of :owner_id, greater_than: 0
      validates_length_of       :name,     minimum: 0

      def initialize(*args)
        super(*args)
        @member_ids = []
      end
    end
  end
end
