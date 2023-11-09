# frozen_string_literal: true

require 'google_drive'

session = GoogleDrive::Session.from_config('config.json')

session.files.each do |file|
  p file.title
end

# p session.upload_from_file("data_table.docx", "data_table.docx", convert: false)

user_email = 'phamphihoan205@gmail.com'
file_id = '1zzs3NXIHj4tEJR33cokNkNzy-4LHfoNu'
file = session.file_by_id(file_id)
file.acl.push(type: 'user', role: 'writer', email_address: user_email)
p file.web_view_link
