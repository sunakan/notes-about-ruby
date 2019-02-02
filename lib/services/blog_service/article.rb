require "active_model"

module Services
  module BlogService
    class Article
      include ActiveModel::Model
      include ActiveModel::Attributes
      include ActiveModel::Validations

      attribute :id,         :integer, default: nil
      attribute :title,      :string,  default: ""
      attribute :created_at, :date,    default: nil

      validates_numericality_of :id, greater_than: 0
      validates_presence_of :title
      validates_presence_of :created_at
    end
  end
end
