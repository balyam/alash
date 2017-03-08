class BelongsTo
  include Neo4j::ActiveRel

  creates_unique
  from_class :Person
  to_class :Clan
  type 'BELONGS_TO'  
    
end
