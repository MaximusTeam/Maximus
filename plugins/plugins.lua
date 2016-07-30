local action = function(msg, matches)
  local text = "🔗 *List Of All Plugins*\n1- start\n2- plugins"
  api.sendReply(msg,text,true)
  end
local triggers = {
  "^/plugins",
  }
return {
  action = action,
  triggers = triggers
}
