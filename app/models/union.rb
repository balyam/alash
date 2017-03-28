class Union
  include Neo4j::ActiveNode
    
  validates :name, presence: true
  validates_length_of :name, maximum: 20
  
  property :name, type: String
  property :translitname, type: String
  property :describe, type: String
  property :imageurl, type: String
  property :menu, type: Boolean, default: false
  
  has_many :in, :tribes, origin: :union

end