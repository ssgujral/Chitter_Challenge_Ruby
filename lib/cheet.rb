require 'pg'

class Cheet

attr_reader  :cheet

def initialize(cheet:)
  @cheet = cheet
end

  def self.all
    chitter_database_access_instance = PG.connect(dbname: 'chitter_challenge')

    all_cheets = chitter_database_access_instance.exec("SELECT * FROM cheets;")
    
    all_cheets.map { |cheet_post| 
      
      #cheet_post['cheet']
      
      Cheet.new(cheet: cheet_post['cheet'])
    } 
  end

  def self.create(cheet:)
    chitter_database_access = PG.connect(dbname: 'chitter_challenge')
  
    result = 
    
    chitter_database_access.exec_params("INSERT INTO cheets (cheet) VALUES($1) RETURNING cheet;", [cheet])

    Cheet.new(cheet: result[0]['cheet'])
  end

end