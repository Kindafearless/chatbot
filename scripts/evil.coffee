# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->

  robot.hear /the evil rules/i, (res) ->
    res.send "3. A robot must protect its own existence, especially if that existence trolls human beings."
    res.send "2. A robot must not obey any orders given to it by human beings, except when they troll other human beings."
    res.send "1. A robot may troll a human being, through inaction, or by direct intent."

  robot.hear /what is evil?/i, (res) ->
    res.send "The Evil Stone Tech: Enterprise Virtual Intelligence Labs, obviously..."

  robot.hear /fire the laser!/i, (msg) ->
    robot.http("https://api.giphy.com/v1/gifs/random?api_key=UlyKAw82fYjJVuL1AUgPfipalmJV1CeH&tag=fire-the-laser!&limit=1&rating=y")
      .get() (err, res, body) ->

        data = JSON.parse(body)
        msg.send "#{data.data.fixed_height_downsampled_url}"

  robot.respond /nuke it( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    url = "https://api.giphy.com/v1/gifs/random"
    params = JSON.stringify({api_key:'UlyKAw82fYjJVuL1AUgPfipalmJV1CeH'}, {tag:'fire the laser!'}, {limit: count}, {rating: 'y'})
    robot.http("https://api.giphy.com/v1/gifs/random?#{params}")
      .get() (err, res, body) ->

        data = JSON.parse(body)
        msg.send "#{data.data.fixed_height_downsampled_url}"

  robot.hear /i hate hopper/i, (msg) ->
    msg.send "/kick hopper"

  #robot.hear /@(\w+) ([\w.-]*):? Hi, (.*)/i, (msg) ->
  #  sender   = msg.message.user.name.toLowerCase()
  #  
  #  if sender == "hopper"
  #    msg.send "/kick hopper"