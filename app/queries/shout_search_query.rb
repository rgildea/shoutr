class ShoutSearchQuery
  def initialize(term:)
    @term = term
  end

  def to_relation
    Shout.where(id: Shout.search { fulltext term }.hits.map(&:primary_key))
    # Shout.where( content: hits.map { |hit| hit.class_name.constantize.new(id: hit.primary_key) } )
  end

  private

  attr_reader :term

end
