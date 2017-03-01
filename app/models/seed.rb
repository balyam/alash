class Seed
  include Neo4j::ActiveRel

  # Relationship from father to son. Son has one father only. Always.
  validate :check_nodes
  creates_unique
  from_class :Person
  to_class :Person
  type 'SEED'

  property :name, type: String

  # method ActiveRel#create here
  def self.create_seed(father, son)
    Seed.create(from_node: father, to_node: son)
  end

  private

  # Check to_node for father. We can't to adopt node, if it already has father.
  def check_nodes
    if to_node[:parent] || to_node.seeds.include?(from_node)
      errors.add(:check_nodes, "#{from_node.name} не может быть отцом для #{to_node.name}")
    end
  end
end
