require 'pg'

class Cheet

attr_reader  :id, :cheet

def initialize(cheet:, id:)
  @id = id
  @cheet = cheet
end

  def self.all
    connection = PG.connect(dbname: 'chitter_challenge')

    result = connection.exec("SELECT * FROM cheets;")
    
    result.map do |cheet_post| 
      Cheet.new(id: cheet_post['id'] ,cheet: cheet_post['cheet'])
    end 

  end

  def self.create(cheet:)
    connection = PG.connect(dbname: 'chitter_challenge')
  
    result = connection.exec_params("INSERT INTO cheets (cheet) VALUES($1) RETURNING id,cheet;", [cheet])

    Cheet.new(id: result[0]['id'], cheet: result[0]['cheet'])
  end

  def self.delete(id:)
    connection = PG.connect(dbname: 'chitter_challenge')

    connection.exec_params("DELETE FROM cheets WHERE id = $1", [id])
  
  end


end