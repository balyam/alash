class Union
  include Neo4j::ActiveNode
  
  validates :name, presence: true
  validates_length_of :name, maximum: 20
  
  property :name, type: String
  property :namecyr, type: String
  property :describe, type: String
  property :imageurl, type: String
  
  has_many :in, :tribes, origin: :union
     
end
