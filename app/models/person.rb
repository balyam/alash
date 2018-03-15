class Person
  include Neo4j::ActiveNode

  validates :name, presence: true
  validates_length_of :name, maximum: 20

  property :name, type: String
  property :text, type: String
  property :status, type: Integer, default: 0
  property :generation, type: Integer
  property :translitname, type: String
  property :sex, type: String

  has_one :out, :ancestor, model_class: :Person, rel_class: :HasFather
  has_one :out, :myclan, model_class: :Clan, rel_class: :BelongsTo
  has_many :out, :seeds, rel_class: :Seed
  has_one :in, :user, rel_class: :ItisMe
  has_one :in, :father, rel_class: :HasFather
  
  def myclan?
    !!self.myclan.present?
  end
end
