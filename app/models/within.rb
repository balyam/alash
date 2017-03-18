class Within
  include Neo4j::ActiveRel
  # Relationship from clan to tribe. Clan is just sub of someone tribe.

  creates_unique
  from_class :Clan
  to_class :Tribe
  type 'WITHIN'
    
end
