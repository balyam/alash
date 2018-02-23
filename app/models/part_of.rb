class PartOf
  include Neo4j::ActiveRel
  # Relationship from tribe to union. Tribe is part of someone union. Always.

  from_class :Tribe
  to_class :Union
  type 'PART_OF'

  property :name, type: String
   
end
