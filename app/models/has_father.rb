class HasFather
  include Neo4j::ActiveRel

  creates_unique
  from_class :Person
  to_class :Person
  type 'HAS_FATHER'
  
   # method ActiveRel#create here
  def self.create_has_father(father, son)
    create(from_node: son, to_node: father)
  end
  
end
