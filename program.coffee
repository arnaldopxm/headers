express = require 'express'
url = require 'url'
path = require 'path'
app = express()

app.set 'view engine', 'pug'
app.set 'views', path.join __dirname, 'views'

app.get '/', (req,res) ->
  sol =
    ipaddress : req.headers['x-forwarded-for'].split(',')[0]
    language : req.headers['accept-language'].split(',')[0]
    software : req.headers['user-agent'].split('(')[1].split(')')[0]

  res.send sol


listener = app.listen process.env.PORT, ->
  console.log 'Your app is listening on port ' + listener.address().port
