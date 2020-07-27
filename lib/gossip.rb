require 'pry'
require 'csv'

class Gossip

  attr_reader :author, :content 

  def initialize(author,content)
    @author = author
    @content = content
    end

  def save
  CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << [@author,@content]
  end
end
    #CSV.open("./db/gossip.csv", "ab") << [@author,@content]
    #my_gossip = Gossip.new("Mon super auteur"," Ma super description")
    #my_gossip.save

  def self.all
  all_gossips = []
  CSV.read("./db/gossip.csv").each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end
  return all_gossips
end

def self.find(id)
  this_gossip =[]
  CSV.read("./db/gossip.csv").select.with_index do |csv_line, csv_index|
   this_gossip << Gossip.new(csv_line[0], csv_index[1]) if id.to_i == csv_index
end
return this_gossip
end

end

#binding.pry