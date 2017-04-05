class BelongsTo
  include Neo4j::ActiveRel
  include Neo4j::Timestamps::Updated

  creates_unique  
  from_class :Person
  to_class :Clan
  type 'BELONGS_TO'

  #validate :belongs_to_clan_already

  private

  def belongs_to_clan_already
    return unless from_node.myclan?
    errors.add("#{from_node.name} belongs to #{from_node.myclan.name} clan already")
    throw :abort
  end
end
