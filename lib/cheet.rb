require 'pg'

class Cheet

attr_reader :id, :cheet

def initialize(id:, cheet:)
  @id = id
  @cheet = cheet
end

  def self.all
    chitter_database_access_instance = PG.connect(dbname: 'chitter_challenge')

    all_cheets = chitter_database_access_instance.exec("SELECT * FROM cheets;")
    
    all_cheets.map { |cheet_post| 
      
      #cheet_post['cheet']
      
      Cheet.new(id: cheet_post['id'], cheet: cheet_post['cheet'])
    } 
  end

  def self.create(cheet:)
    chitter_database_access = PG.connect(dbname: 'chitter_challenge')
  
    result = chitter_database_access.exec("INSERT INTO cheets (cheet) VALUES('#{cheet}') RETURNING id, cheet")

    Cheet.new(id: result[0]['id'], cheet: result[0]['cheet'])
  end

end