class Tribe
  include Neo4j::ActiveNode
  property :name, type: String
  property :namecyr, type: String
  property :text, type: String, default: 'Fill the form'
  property :uran, type: String

  validates :name, presence: true
  validates :union_id, presence: true, on: :create
  has_one :out, :union, model_class: :Union, rel_class: :PartOf
  has_many :in, :clans, origin: :tribe
end
