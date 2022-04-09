require 'pg'

def persisted_data(:id)
  connection = PG.connect(dbname: 'chitter_challenge')
  result = connection.query("SELECT * FROM cheets WHERE id = #{id};")
  result.first
end