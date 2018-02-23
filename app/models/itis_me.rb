# Relation between User and Person.
# A User only Person.
class ItisMe
  include Neo4j::ActiveRel
  
  creates_unique
  from_class :User
  to_class :Person
  type 'ITIS_ME'

  def self.create_itisme(current_user, person)
    ItisMe.create(from_node: current_user, to_node: person)
  end
end
