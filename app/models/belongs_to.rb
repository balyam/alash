class BelongsTo
  include Neo4j::ActiveRel
  include Neo4j::Timestamps::Updated

  creates_unique
  validate :belongs_to_clan_already
  from_class :Person
  to_class :Clan
  type 'BELONGS_TO'
  
  private
  
  def belongs_to_clan_already
    if from_node.myclan
    errors.add("#{from_node.name} belongs to #{from_node.myclan.name} clan already")
    end
  end      
end
