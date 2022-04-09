require 'pg'

class Cheet
  def self.all
    chitter_database_access_instance = PG.connect(dbname: 'chitter_challenge')
    all_cheets = chitter_database_access_instance.exec("SELECT * FROM cheets;")
    all_cheets.map { |cheet_post| cheet_post['cheet']} 
  end

  def self.create(cheet_post:)
    chitter_database_access = PG.connect(dbname: 'chitter_challenge')
  
    chitter_database_access.exec("INSERT INTO cheets (cheet) VALUES('#{cheet_post}')")
  end

end