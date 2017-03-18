class Clan
  include Neo4j::ActiveNode
  
  validates :name, presence: true
  validates_length_of :name, maximum: 20
  validates :tribe_id, presence: true, on: :create

  property :name, type: String
  property :namecyr, type: String
  property :text, type: String, default: 'Fill the form for clan'  

  has_one :out, :tribe, model_class: :Tribe, rel_class: :Within
end
