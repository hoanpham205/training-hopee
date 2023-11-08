# frozen_string_literal: true

require 'faraday'
require 'json'
require 'htmltoword'
class DocExporter
  def initialize(users)
    @users = users
  end

  def exec
    my_html = '<html><head>'
    my_html += '<style>h1 { text-align: center; font-size: 24px; color: #333; }</style>'
    my_html += '</head><body>'

    my_html += '<h1>Danh sach nguoi dung</h1>'

    my_html += '<table border="1"><tr><th>Created At</th><th>Name</th><th>Avatar</th><th>Sex</th>
    <th>Active</th><th>ID</th></tr>'

    @users.each do |item|
      my_html += '<tr>'
      item.each do |_, value|
        my_html += if value.nil?
                     '<td style="background: #1322"></td>'
                   else
                     "<td>#{value}</td>"
                   end
      end
      my_html += '</tr>'
    end

    my_html += '</table></body></html>'

    Htmltoword::Document.create_and_save(my_html,
                                         '/home/hoan/workspace/training-hopee/Week-4/Homework/8-11/data_table.docx')
  end
end
