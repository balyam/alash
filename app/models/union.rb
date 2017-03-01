class Union
  include Neo4j::ActiveNode
  property :name, type: String
  property :namecyr, type: String
  property :describe, type: String
  property :imageurl, type: String

  validates :name, presence: true
  has_many :in, :tribes, origin: :union
end
