# Relationship from father to son. Son has one father only. Always.
class Seed
  include Neo4j::ActiveRel
  include Neo4j::Timestamps::Updated

  validate :check_nodes
  creates_unique
  from_class :Person
  to_class :Person
  type 'SEED'

  property :name, type: String

  # ActiveRel#create here
  def self.create_seed(father, son)
    Seed.create(from_node: father, to_node: son)
  end

  private

  # HACK: Check to_node for father. We can't to adopt node, if it already has father.
  def check_nodes
    if to_node.ancestor.present?
      unless to_node.ancestor.eql?(from_node)
        errors.add("#{from_node.name} не может быть отцом для #{to_node.name}")
      end
    elsif to_node.eql?(from_node)
      errors.add("#{from_node.name} не может быть отцом самому себе")
    end
  end

  # If Seed relation was deleted we have to delete HasFather relation
  def delete_hasfather_rel; end
end
