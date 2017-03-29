class Tribe
  include Neo4j::ActiveNode

  before_destroy :tribe_has_union
  
  validates :name, presence: true
  validates_length_of :name, maximum: 20
  validates :union_id, presence: true, on: :create
  
  property :name, type: String
  property :translitname, type: String
  property :text, type: String, default: 'Fill the form'
  property :uran, type: String
  
  has_one :out, :union, model_class: :Union, rel_class: :PartOf
  has_many :in, :clans, origin: :tribe

  private 

  # Can not be removed if there is union
  def tribe_has_union
    return unless self.union.present?
    errors.add("#{self.name} has relation with union!")
    throw :abort
  end
end
