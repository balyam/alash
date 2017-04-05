class ItisMe
  include Neo4j::ActiveRel

  creates_unique  
  from_class :User
  to_class :Person
  type 'Itis_Me'
  
end