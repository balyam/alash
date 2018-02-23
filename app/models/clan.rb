class Clan
  include Neo4j::ActiveNode

  before_destroy :clan_has_tribe?

  validates :name, presence: true
  validates_length_of :name, maximum: 20
  validates :tribe_id, presence: true, on: :create

  property :name, type: String
  property :translitname, type: String
  property :text, type: String, default: 'Fill the form for clan'

  has_one :out, :tribe, model_class: :Tribe, rel_class: :Within

  private

  # Can not be removed if there is tribe
  def clan_has_tribe?
    return unless tribe.present?
    errors.add("#{name} has relation with tribe!")
    throw :abort
  end
end
