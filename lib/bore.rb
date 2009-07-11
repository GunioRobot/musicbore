require 'rubygems'
require 'irc'

class Bore
  def initialize
    Namespace.register(:foaf, 'http://xmlns.com/foaf/0.1/')
    Namespace.register(:mo, 'http://purl.org/ontology/mo/')
    Namespace.register(:bore, 'http://github.com/bore/')
    Namespace.register(:bio, 'http://purl.org/vocab/bio/0.1/')
    adapter = ConnectionPool.add_data_source(:type => :redland, :location => 'db/triples')
  end
  
  def bore(topic=nil)
    fact_finder = determine_fact_finder(topic)
    fact_finder.statements
  end
  
  protected
  
  def determine_fact_finder(topic)
    ArtistFactFinder.new(topic)
  end
end

bore = Bore.new
p bore.bore('http://www.bbc.co.uk/music/artists/9b51f964-2f24-46f4-9550-0f260dcdad48#artist')


