# frozen_string_literal: true

require './user_service'
require './doc_exporter'
require './importer'

user_data = UserService.active_users

doc_exporter = DocExporter.new(user_data)
doc_exporter.exec

# importer = Importer.new('users.csv')
# importer.exec
