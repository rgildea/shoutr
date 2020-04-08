class ShoutSearchQuery
  def initialize(term:)
    @term = term
  end

  def to_relation
    hits = Sunspot.search([TextShout, PhotoShout]) { fulltext term }.hits
    Shout.where( content: hits.map { |hit| hit.class_name.constantize.new(id: hit.primary_key) } )
  end

  private

  attr_reader :term

end
