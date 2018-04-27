class HasFather
  include Neo4j::ActiveRel

  after_create :create_seed_rel
  creates_unique
  from_class :Person
  to_class :Person
  type 'HAS_FATHER'

  # method ActiveRel#create here
  def self.create_has_father(father, son)
    create(from_node: son, to_node: father)
  end

  private

  # Callback creates Seeds relation at the same time with HasFather
  def create_seed_rel
    Seed.create_seed(to_node, from_node)
  end
end
