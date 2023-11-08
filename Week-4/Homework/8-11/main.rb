require './user_service' 
require './doc_exporter.rb'
require './importer.rb'

user_data = UserService.active_users

doc_exporter = DocExporter.new(user_data)
doc_exporter.exec

# importer = Importer.new('users.csv')
# importer.exec
