class Clan
  include Neo4j::ActiveNode

  property :name, type: String
  property :text, type: String, default: 'Fill the form for clan'

  validates :name, presence: true
  validates :tribe_id, presence: true, on: :create

  has_one :out, :tribe, model_class: :Tribe, rel_class: :Within
end
