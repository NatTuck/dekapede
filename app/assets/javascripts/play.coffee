

start_coms = () ->
  window.faye = new Faye.Client('http://localhost:3000/faye')

  token = $('#auth-token').val()

  sub = faye.subscribe "/events/#{token}", (msg) ->
    $('.msgs').append("<p>#{msg.text}</p>")

  faye.publish('/commands', {op: 'connect', token: token})

$(start_coms)

#$('#btn').click () ->
#  client.publish('/spam', {text: 'Hi there'})
