require 'docx'
require 'axlsx'

# Create a new .docx file
doc = Docx::Document.new

# Create a new worksheet
p = Axlsx::Package.new
wb = p.workbook
ws = wb.add_worksheet(name: 'Chart')

# Add data to the worksheet
data = [
  ['Category', 'Value'],
  ['A', 10],
  ['B', 20],
  ['C', 15]
]
ws.add_row(data[0])
ws.add_row(data[1])
ws.add_row(data[2])
ws.add_row(data[3])

# Create a chart in the worksheet
chart = ws.add_chart(Axlsx::Pie3DChart, start_at: 'A5', end_at: 'F16') do |c|
  c.add_series(data: ws['B2:B4'], labels: ws['A2:A4'])
end

# Save the workbook to a temporary file
temp_file = Tempfile.new('chart.xlsx')
p.serialize(temp_file.path)
temp_file.close

# Insert the chart into the .docx file
doc.append_chart(temp_file.path)

# Save the .docx file
doc.save('chart.docx')
