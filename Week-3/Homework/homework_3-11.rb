require 'faraday'

res = Faraday.get('https://6418014ee038c43f38c45529.mockapi.io/api/v1/users')

p res.status

conn = Faraday.new(
  url: 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users',
  params: {id: '5'},
  headers: {'Content-Type' => 'application/json'}
  )

p response = conn.get('get', {id: '4'})
