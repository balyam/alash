class Person
  include Neo4j::ActiveNode

  before_destroy :no_parent

  validates :name, presence: true

  property :name, type: String
  property :text, type: String
  property :status, type: Integer, default: 0
  property :parent, type: Boolean, default: false
  property :generation, type: Integer
  property :latname, type: String
  property :clantitle, type: String
  property :tribetitle, type: String
  property :sex, type: String

  has_one :in, :father, unique: true, origin: :Person
  has_many :out, :seeds, rel_class: :Seed

  private

  # after destroy- we have to change parent attribute to false
  def no_parent
    seeds.each_with_rel do |_n, r|
      r.to_node.update_attribute(:parent, false)
    end
  end
end
