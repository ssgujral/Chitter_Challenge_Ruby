require 'pg'

class Cheet
  def self.all
    chitter_database_access = PG.connect(dbname: 'chitter_challenge')
    all_cheets = chitter_database_access.exec("SELECT * FROM cheets;")
    all_cheets.map { |cheet_post| cheet_post['cheet']}
    
  end
end