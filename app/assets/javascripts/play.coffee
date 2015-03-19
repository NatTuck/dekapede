
command = (op, args) ->
  faye.publish('/commands', {op: op, args: args, token: token})

fill_template = (name, data) ->
  JST['templates/' + name](data)

show = (tpl, sel, data) ->
  $(sel).html(fill_template(tpl, data))

show_message = (msg) ->
  $('#messages').prepend(fill_template('message', msg))

server_message = (msgs) ->
  for msg in msgs.updates
    [tag, data] = msg
    console.log(tag, data)
    switch tag
      when 'main-view'
        show('main-view', '#main-view', data)
      when 'message'
        show_message(data)
      else console.log(tag, data)

start_coms = () ->
  window.faye  = new Faye.Client('http://localhost:3000/faye')
  window.token = $('#auth-token').val()

  sub = faye.subscribe("/events/#{token}", server_message)

  command('connect', {})

register_btns = () ->
  $('#btn-north').click () ->
    command('move', 'north')
  $('#btn-south').click () ->
    command('move', 'south')

$(() ->
  if $('body.play-index').length > 0
    start_coms()
    register_btns()
)

#$('#btn').click () ->
#  client.publish('/spam', {text: 'Hi there'})
